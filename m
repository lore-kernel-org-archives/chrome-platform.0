Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C03D3B29
	for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 16:59:47 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id m185so4392825iof.10
        for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 08:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6zyq73HTm/un92FVOEIYcp2e6RteV0rl4PLFbEb9o0=;
        b=ksn2GIXn0E5pEd96qkYJ0W+yOAwYe0om2CulIiQukSaVzwkJ6Yf6OJA0Em6jwR8V2T
         SNaQVslc8QVQPMl2a++Grrsh1Vlm5g7CDo0d8uPTkSdRkYVMN6OsrlpFTe4h8hyaussn
         iuWABoex6sOGmYgY0cXki70VtXytFMpdsQlf+n8Wh1Sau2czqx6oYdtvownkJyxAjoN+
         puAdBocXY/5fEnBVCYYSJsofpde3l7VKJ/e7oh6SIq+NV/N9hDonnjW3AUYalDJ2l45O
         oFoF39w30/zk4uChG4odd+d48GWkN6qOkqRiA2AohT0ej4UvDHe/yj/fy8GRAzJmYjMW
         TCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6zyq73HTm/un92FVOEIYcp2e6RteV0rl4PLFbEb9o0=;
        b=UsGPj7d6TexwncCIKyAlCuYOXbicFJQrfTajqfJvbHA3Uz/vQlt+Z8IJHLUihAZb9w
         wg6dGE6BGfniCiY9ZgiCqXOQPISQbLPOW1i55y85weTpbF7AkADdTt7w354CpAbLEbJR
         i8GtWHvFqmf94SQiTRaaDak5BygggSj5U2BbWGLc0wY8mHm3XUwtFSooFxIv7AJaYfox
         uNQsU38ptgP1aMJI5yRdvRdixJZYaA6jx8Dyn3VmMedwVUrxMz11bKIomty+b3Sw8aWy
         lH0l4pF3Q9Br0STE3Lrs5yYhU9TciTZX7ZDWi2OR8G/XFYra2c+JSRUy9wPjX2UWOsOz
         3aZg==
X-Gm-Message-State: AOAM531G/zLSNRsdG+CUTAgKN+dYJD3yAFmZ87lhIY3yvZnq0969hUOq
	dZBk3awiXuRthiSPPpG/0ykZFeKc1wl4+MPk
X-Google-Smtp-Source: ABdhPJyu0wZSTDt0ENFstYHC0x1AYz6DzrhZvzm5ck0wCOAw3ARxqbhEfAQ/TFER92vYU+/GxfII0Q==
X-Received: by 2002:a02:3b5d:0:b0:30d:1144:4102 with SMTP id i29-20020a023b5d000000b0030d11444102mr2517550jaf.183.1645117186524;
        Thu, 17 Feb 2022 08:59:46 -0800 (PST)
Received: from rigel.delfino.n.howett.net ([2600:1700:df50:a7cf::725])
        by smtp.googlemail.com with ESMTPSA id a15sm2108346ilq.24.2022.02.17.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:59:46 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: chrome-platform@lists.linux.dev
Cc: Benson Leung <bleung@chromium.org>,
	Aseda Aboagye <aaboagye@chromium.org>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Michael Niksa <michael.niksa@live.com>,
	"Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v3 1/2] platform/chrome: cros_ec_lpcs: detect the Framework Laptop
Date: Thu, 17 Feb 2022 10:59:29 -0600
Message-Id: <20220217165930.15081-2-dustin@howett.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217165930.15081-1-dustin@howett.net>
References: <20220217165930.15081-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Framework Laptop identifies itself in DMI with manufacturer
"Framework" and product "Laptop".

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index d6306d2a096f..458eb59db2ff 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -500,6 +500,14 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Glimmer"),
 		},
 	},
+	/* A small number of non-Chromebook/box machines also use the ChromeOS EC */
+	{
+		/* the Framework Laptop */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
+		},
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
-- 
2.34.1

