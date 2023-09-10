function search_course() {
    let searched_course = document.getElementById('search-bar').value.trim();

    
    if (!searched_course) {
        alert('search here');
        return;
    }

    
    const params = new URLSearchParams();
    params.append('all-categories', searched_course);

    const url = `/search?${params.toString()}`;
    
    window.open(url, '_blank').focus();
}
