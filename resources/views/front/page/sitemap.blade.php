@php
echo '<?xml version="1.0" encoding="UTF-8"?>';
@endphp
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">    
    @foreach($users as $user)
    <url>
        <loc>{{$user->url}}</loc>
    </url> 
    @endforeach      
    @foreach($pastes as $paste)
    <url>
        <loc>{{$paste->url}}</loc>
    </url> 
    @endforeach       
</urlset>