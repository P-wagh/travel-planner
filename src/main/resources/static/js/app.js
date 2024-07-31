/**
 * 
 */

// for user Dashboard
// edit profile start
$(document).ready(function() {
    let editStatus = false;
    $("#edit-profile").click(function() {

        if (editStatus == false) {
            $("#showProfile").hide();
            $("#editProfile").show();

            editStatus = true;

            $(this).text("Back");
        } else {
            $("#showProfile").show();
            $("#editProfile").hide();

            editStatus = false;

            $(this).text("Edit");
        }
    })
});
// edit profile end


// Script for the drop down menu
$('.dropdown-submenu a.dropdown-toggle').on("click", function(e) {
    var $subMenu = $(this).next(".dropdown-menu");
    if (!$subMenu.hasClass('show')) {
        $subMenu.parents('.dropdown-menu').first().find('.show').removeClass("show");
    }
    $subMenu.toggleClass('show');
    $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
        $('.dropdown-submenu .show').removeClass("show");
    });
    return false;
});


// for sweet alert
function deleteUser(uid){

    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            fetch('/user/delete/' + uid, {
                method: 'DELETE',
            })
            .then(response => {
                if (response.ok) {
                    Swal.fire("Deleted!", "Your account has been deleted.", "success").then(() => {
                        // Redirect to a suitable page after deletion
                        window.location = '/home';
                    });
                } else {
                    Swal.fire("Error!", "There was a problem deleting your account.", "error");
                }
            })
            .catch(error => {
                Swal.fire("Error!", "There was a problem deleting your account.", "error");
            });
        } else {
            Swal.fire("Cancelled", "Your profile is safe.", "info");
        }
    });
}





// Payment integration start
const paymentStart = (amt, tripId) => {
    console.log(amt)

    $.ajax(
        {
            url: '/user/createOrder',
            data: JSON.stringify({ amount: amt, tripId: tripId, info: 'order_request' }),
            contentType: 'application/json',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                // this function run when success
                console.log(response)
                console.log(response.id)

                if (response.status == "created") {
                    // open payment form

                    let options = {
                        "key": "rzp_test_gdTKt6nq4H7aFT", // Enter the Key ID generated from the Dashboard
                        "amount": response.amount, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                        "currency": "INR",
                        "name": "Travel-Planner", //your business name
                        "description": "Explore the destination with us",
                        "image": "/images/logo.svg",
                        "order_id": response.id, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                        "callback_url": "https://eneqd3r9zrjok.x.pipedream.net/",
                        "handler": function (response) {
                            console.log(response.razorpay_payment_id);
                            console.log(response.razorpay_order_id);
                            console.log(response.razorpay_signature);
                            console.log("payment succsessful")

                            // to update the status value in the payment table
                            updatePaymentOnServer(response.razorpay_payment_id, response.razorpay_order_id,'paid');

                            // alert("payment successfull")
                            // Swal.fire({
                            //     title: "Payment Successfull!",
                            //     text: "Your seat is booked!",
                            //     icon: "success"
                            // });
                        },
                        "prefill": { //We recommend using the prefill parameter to auto-fill customer's contact information especially their phone number
                            "name": "", //your customer's name
                            "email": "",
                            "contact": "" //Provide the customer's phone number for better conversion rates 
                        },
                        "notes": {
                            "address": "Plan your trip with travel planner"
                        },
                        "theme": {
                            "color": "#3399cc"
                        }
                    };

                    var rzp1 = new Razorpay(options);
                    rzp1.on('payment.failed', function (response) {
                        console.log(response.error.code);
                        console.log(response.error.description);
                        console.log(response.error.source);
                        console.log(response.error.step);
                        console.log(response.error.reason);
                        console.log(response.error.metadata.order_id);
                        console.log(response.error.metadata.payment_id);
                        // alert("Payment faild..!!")
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: "Something went wrong! Payment faild..!!",
                            // footer: '<a href="#">Why do I have this issue?</a>'
                        });
                    });

                    rzp1.open();
                }
            },
            error: function (error) {
                // this function run when error
                console.log(error)
                alert("Something went wrong.!!")
            }
        }
    )

}

function updatePaymentOnServer(payment_id, order_id, status)
{
    $.ajax({
        url:"/user/updatePayment",
        data: JSON.stringify({payment_id:payment_id, order_id:order_id,status:status}),
        contentType:"application/json",
        type:"POST",
        dataType:"json",
        success:function(response){
            Swal.fire({
                title: "Payment Successfull!",
                text: "Your seat is booked!",
                icon: "success"
            });
        },
        error:function(error){
            Swal.fire({
                icon: "error",
                title: "Oops...",                            
                text: "Your payment is successfull, but we did not get on server we will contact you as soon as possible",
                // footer: '<a href="#">Why do I have this issue?</a>'
            });
        },
    })
}
// payment integration end