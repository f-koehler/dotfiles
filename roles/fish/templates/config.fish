{% for hook in fish_hooks %}
{{ hook }}
{% endfor %}

{% for export in xdg %}
set -U XDG_{{ export|upper }} {{ xdg[export] }}
{% endfor %}

{% for export in exports %}
set -U {{ export|upper }} {{ exports[export] }}
{% endfor %}
