{% for hook in fish_hooks %}
{{ hook }}
{% endfor %}

{% for export in exports %}
set -U {{ export|upper }} {{ exports[export] }}
{% endfor %}
