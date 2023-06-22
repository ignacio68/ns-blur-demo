<script lang="ts" setup>
  import { ref } from "nativescript-vue";
  import { registerSwiftUI, UIDataDriver, SwiftUI } from "@nativescript/swift-ui";

  const counter = ref(0);
  const blurValue = ref(0);
  const isVisible = ref(false);
  let swiftUI: SwiftUI;

  interface BlurData {
    blurValue: number;
  }

  const data: BlurData = {
    blurValue: blurValue.value
  };

  function onTap() {
    console.log("ON TAP!!");
    isVisible.value = !isVisible.value;
  }

  function onBlurValueChanged() {
    console.log("blur value: ", blurValue.value);
    swiftUI.updateData({ blurValue: blurValue.value });
  }

  function onLoaded(args) {
    swiftUI = args.object;
    console.log("Swift UI component Loaded", swiftUI);
  }

  // @ts-ignore
  // declare const SampleViewProvider: any;
  // registerSwiftUI("sampleView", (view) => new UIDataDriver(SampleViewProvider.alloc().init(), view));
  // declare const AlertViewProvider: any;
  // registerSwiftUI("alertView", (view) => new UIDataDriver(AlertViewProvider.alloc().init(), view));
  declare const RegularBlurViewProvider: any;
  registerSwiftUI("regularBlurView", (view) => new UIDataDriver(RegularBlurViewProvider.alloc().init(), view));
  declare const MaterialBlurViewProvider: any;
  registerSwiftUI("materialBlurView", (view) => new UIDataDriver(MaterialBlurViewProvider.alloc().init(), view));
</script>

<template>
  <Frame>
    <Page>
      <ActionBar>
        <Label text="Blur effect" class="font-bold text-lg" />
      </ActionBar>

      <!-- <GridLayout rows="auto, auto" class="p-20">
        <Button row="0" class="outline outline-offset-2 outline-blue-500" text="prueba" @tap="onTap"></Button>
        <SwiftUI v-if="isVisible" row="1" swiftId="sampleView" height="150"></SwiftUI>
      </GridLayout> -->
      <GridLayout class="m-4" rows="300, auto">
        <SwiftUI row="0" width="300" swiftId="regularBlurView" @loaded="onLoaded"></SwiftUI>
        <Slider row="1" v-model="blurValue" value="0" @valueChange="onBlurValueChanged" minValue="0" maxValue="10" />
      </GridLayout>
    </Page>
  </Frame>
</template>

<style>
  /* .info {
    font-size: 20;
  } */
</style>
