<template>
    <div>
        <h3>© 2024 Hall's Creek Tree Farm.  All rights reserved.</h3>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>
h3 {
    font-family: 'IM Fell English', serif;
    text-align: center;
    font-size: 1.75em;
    color: rgb(173, 160, 116);
    background-color: rgb(95, 136, 118);
    height: 3rem;
    margin: 0 0 0 0;
    padding-top: 0.5rem;
}


/* Styles for tablets and smaller devices */
@media screen and (max-width: 768px) {
  h3 {
    font-size: 1.5em; /* Slightly smaller font size for tablets */
    padding-top: 0.3rem;
    height: 2.5rem;
  }
}

/* Styles for smaller mobile devices */
@media screen and (max-width: 480px) {
  h3 {
    font-size: 1.25em; /* Even smaller font size for mobile phones */
    padding-top: 0.2rem;
    height: 2rem;
  }
}
</style>