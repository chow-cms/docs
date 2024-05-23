import type { DocsThemeConfig } from "nextra-theme-docs";
import React from "react";

const config: DocsThemeConfig = {
  logo: <span>chow</span>,
  footer: {
    text: "Chow Docs",
  },
  docsRepositoryBase: "https://github.com/chow-cms/docs",
  useNextSeoProps() {
    return {
      titleTemplate: "%s – Chow",
      description: "Chow Docs",
    };
  },
};

export default config;
