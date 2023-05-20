---
DOI: {{DOI}}
Title: {{title}}
Summary: ""
Year: {{date | format ("YYYY")}}
___

{{title}}

{% for t in tags %}#{{t.tag | replace(' ','-')}} {% endfor %}

> [!Cite]
> {{bibliography}}

{% for n in notes %}
{{n.note}}
{% endfor %}

{{pdfZoteroLink}}

## Annotations

{% for annotation in annotations %}
{% if annotation.annotatedText %}{{annotation.annotatedText}}{% endif %}
{% if annotation.imageBaseName %}![[{{annotation.imageBaseName}}]]{% endif %}
{% if annotation.comment %}=={{annotation.comment}}=={% endif %}
{% endfor %}
