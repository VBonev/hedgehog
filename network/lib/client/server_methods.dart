//https://api.imgur.com/
// 3/gallery/
// {{section}}/
// {{sort}}/
// {{window}}/
// {{page}}

// https://api.imgur.com/3/gallery/
// search/
// {{sort}}/
// {{window}}/
// {{page}}
// ?q=cats

//methods
const String galleryPath =
    '/3/gallery/{$sectionParam}/{$sortParam}/{$windowParam}/{$pageParam}';
const String searchPath = '$galleryPath/search';

//path params
const String sectionParam = 'section';
const String sortParam = 'sort';
const String windowParam = 'window';
const String pageParam = 'page';

// query params
const query = 'q';
