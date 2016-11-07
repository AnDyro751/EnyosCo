console.log "Post creatdo"
$("#posts").prepend("<%= j render @post %>")
$("#post_body").val("")
