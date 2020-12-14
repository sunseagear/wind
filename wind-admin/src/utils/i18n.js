// translate router.meta.title, be used in breadcrumb sidebar tagsview
import store from '@/store'
export function generateTitle(title) {
  const hasKey = this.$te('route.' + title)

  if (hasKey) {
    // $t :this method from vue-i18n, inject in @/lang/index.js
    const translatedTitle = this.$t('route.' + title)

    return translatedTitle
  }
  return title
}
export function setTagsViewTitle(route, title) {
  if (title === undefined) {
    return
  }
  const tempRoute = Object.assign({}, route)
  const routeObj = Object.assign({}, tempRoute, { meta: { title: `${title}` }})
  store.dispatch('tagsView/updateVisitedView', routeObj)
}

