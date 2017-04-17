$(document).ready(function(){
	$('#url_form').submit(function(e){
		e.preventDefault();
		$.ajax({
			url: '/urls',
			method: 'post',
			data: $(this).serialize(),
			dataType: 'json',
			success:function(data){
				//$('#table')
				console.log("success path")
        		$('tr:first-child').after('<tr> <td>' + data.short_url + '</td> <td>' + data.long_url + '</td>  <td>' + data.click_count + '</td> </tr>')
      			
			}
			,
			error:function(data){
				//$('#table')
				console.log("error path")
				
			}
		
		});
	});
});