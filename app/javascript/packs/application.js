// stylesheets
import 'stylesheets/jquery-seat-plan'
import '../sass/application'

// images
function importAll (r) {
  r.keys().forEach(r);
}
importAll(require.context('../images/', true, /\.(jpg|png)$/));

import 'jquery-ujs'
