<script lang="ts">
    import {onMount} from 'svelte';

    let topLevelDomain: string = "";
    let country: string = "";

    onMount(() => {
        let url = window.location.hostname;
        let parts = url.split('.');
        topLevelDomain = parts[parts.length - 2] + '.' + parts[parts.length - 1];
        country = topLevelDomain === "co.nz" ? "New Zealand" : "Singapore";
    });
</script>

<div style='padding-top: 5rem'>
    <img style='width: 50rem; height: auto' src='https://kihstorageaccount.blob.core.windows.net/public/logo.png'
         alt='Kontinuum Investment Holdings Logo'/>
</div>

<div style='padding-top: 3rem;'>
    <div id="line"></div>
    <p style='font-size: 1.5rem;'>A Private Investment Holding Company</p>
    <p style='font-style: italic; padding-top: 0.5rem; font-size: 1rem;'><a
            href='mailto:info@kih.{topLevelDomain}'>info@kih.{topLevelDomain}</a></p>
</div>

<div class="footer">
    <p style='font-size: 1rem;'>© Kontinuum Investment Holdings {country} {new Date().getFullYear()}</p>
</div>  