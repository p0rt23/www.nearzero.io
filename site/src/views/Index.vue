<template>
  <div class="wrapper">
    <parallax
      class="section page-header header-filter"
      parallax-active="true"
      :style="headerStyle"
    >
      <div class="container">
        <div class="md-layout">
          <div class="md-layout-item md-size-50 md-small-size-100">
            <h1 class="title">
              A Minecraft server
            </h1>
            <h4>
              <ul>
                <li>minecraft.nearzero.io</li>
                <li>Java Edition v1.15.2</li>
                <li><a href="https://hermitcraft.com/">HermitCraft S7</a> <a href="https://vanillatweaks.net/share/#hermitcraft-s7">Datapacks</a></li>
              </ul>
            </h4>
          </div>
        </div>
      </div>
    </parallax>
    <div class="main main-raised">
      <div class="section">
        <div class="container">
          <div class="md-layout">
            <div
              class="md-layout-item md-size-66 md-small-size-100 mx-auto text-center"
            >
              <h2 class="title text-center">
                World downloads?
              </h2>
              <h5 class="description">
                Click <a href="/minecraft/?sort=time&order=desc">here</a> for hourly backups.
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Mixins from "@/plugins/basicMixins";

export default {
  mixins: [Mixins.HeaderImage],
  bodyClass: "landing-page",
  data() {
    return {
      image: require("@/assets/img/bg7.jpg"),
    };
  }
};
</script>
