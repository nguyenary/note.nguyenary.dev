@php
echo '<?xml version="1.0" encoding="UTF-8"?>';
@endphp
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <sitemap><loc>{{ route('sitemap.main') }}</loc><lastmod>{{date('Y-m-d')}}</lastmod></sitemap>
        @while(strtotime($start_date) <= strtotime($end_date)) 
            <sitemap><loc>{{route('sitemap.show',[$start_date])}}</loc><lastmod>{{date('Y-m-d')}}</lastmod></sitemap>            
            @php $start_date = date ("Y-m-d", strtotime("+1 day", strtotime($start_date))); @endphp
        @endwhile
</sitemapindex>