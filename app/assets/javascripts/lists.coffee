$ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el, delay: 200)

    $ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el,
      delay: 200,
      onUpdate: (evt) ->
        $.ajax
          url: 'parent/' + $("#parent_id").val() + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex, to: evt.newIndex }
    )