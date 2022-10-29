function render_partial() {
  $('#partial-area').html('<%=j render :partial, @partial %>')
}
