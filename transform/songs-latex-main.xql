import module namespace m='http://www.tei-c.org/pm/models/songs/latex' at 'songs-latex.xql';

declare variable $xml external;

declare variable $parameters external;

let $options := map {
    "styles": ["transform/songs.css"],
    "collection": "/db/apps/dodis/transform",
    "parameters": if (exists($parameters)) then $parameters else map {}
}
return m:transform($options, $xml)