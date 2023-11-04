const clearHistoryTooltip = 'Clear Search history';
const appTitle = 'Imgur Demo';
const noSearchLabel = 'No search history';
const clearHistoryLabel = 'Search history cleared';
const detailsTitle = 'Image Details';
const scoreLabel = 'Total score';
const viewsLabel = 'Total views';

String favoriteToast(bool isFavorite) =>
    'Image is ${isFavorite == true ? 'added' : 'removed'} to favorites';
