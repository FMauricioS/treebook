$(document).ready(function () {

	$('#add-friendship').on('click', function (event) {
		event.preventDefault()
		var addFriendsgipBtn = $(this)
		$.ajax({
			url: Routes.user_friendships_path({user_friendship: friend_id: addFriendsgipBtn.data('friendId')})
			dataType: 'json',
			type: 'POST',
			success: function(e) {
				addFriendsgipBtn.hide()
				$('#friend-status').html("<a href='' class='btn btn-success'> Friendship Requested </a>")
			}
		})
	})

})