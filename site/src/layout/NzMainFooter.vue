<template>
  <footer
    class="footer"
    :class="{
      [`footer-${type}`]: type,
      [`footer-${size}`]: size
    }"
    :data-background-color="backgroundColor"
  >
    <template>
      <div class="container">
        <nav>
          <ul>
          </ul>
        </nav>
        <div class="copyright">
          &copy; {{ year }}
        </div>
      </div>
    </template>
  </footer>
</template>
<script>
export default {
  props: {
    backgroundColor: String,
    type: String,
    size: String
  },
  data() {
    return {
      year: new Date().getFullYear()
    };
  }
};
</script>
<style></style>
