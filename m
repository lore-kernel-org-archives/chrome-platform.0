Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FE14011
	for <chrome-platform@lists.linux.dev>; Thu, 20 Jul 2023 22:37:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso2115455e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 20 Jul 2023 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689892638; x=1690497438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDwVNaCwLkj+T7Bsxj7osVe4IR5sds5yMUqYgBnFTec=;
        b=RrpAlqUm0mabMdrW7xEK50l1GNF6iN49ca5j+EY9M/WgnCWiXIvFzGDu74LWDP9eVd
         hjw6NTvs9gFiwvKY3UTHybpIibi9dafuXULKm8ypdzSxXXKRlE5F5Kr0QdG4qc0Mhc3t
         Z1+AbQPZUhtokYv1qL/qSmCi195Raf3yd0xn1gyGbhFxuJs5oToufDDt84iI+mEHt25k
         vi8txd/Tfn/QhlWKD5cUAmnVFv9BnXXR4j0UNlEY+dgvO7FsQVaV5//uD2W2ic8Tmm7a
         E03K+sR9xFjetBixY26Zd15iuY39Q92GfWofhIXeQ9oCTPG2/OrKiJZkapn7K/IOYCAe
         RL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689892638; x=1690497438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDwVNaCwLkj+T7Bsxj7osVe4IR5sds5yMUqYgBnFTec=;
        b=Z869rCnOKeq8GtLsirpmWk6MjGoNuoCYGED8mpyLMUgPqTDIvl5aOb47OkaguA3EDN
         RZB3kTdK2TXTFyPpSKEnQBeQsPXOAN+kvB1lPcGrO+rH333ZLBr79wuWZ4CYMtMhvwIR
         0+44aYUIxoDIBYlJyvrrtltIoay6AZhakDH+RzNBM+75TgWxJeaIz6Yjzk1eDLpcCGi/
         kKvJrAposCV046x3FoyuHnVGFTU4B56JLFy9/8cAOfIR70d5FPPlroFSURpytD5tX8Yt
         nKj6my8mid0hC1t8SNaCOql8VZHNodjjw1OsT0C+KBAcP+uxRTln9/IXQV07tPYv0m80
         KtDQ==
X-Gm-Message-State: ABy/qLaTCiE7Brcp8ODyS1motbgIB0BTPW2W034tkkr3ebo25JYQB47Y
	TCqyBZ3wIN6FeZQNGOMC+cs=
X-Google-Smtp-Source: APBJJlGijby0oVBSlZQzPuE6wRs33kVNUMfK5HpKn/sbtkGkZX2707uwvvqV3FhTi9lLbUL+RHxxuQ==
X-Received: by 2002:a05:6512:3da7:b0:4fb:52a3:e809 with SMTP id k39-20020a0565123da700b004fb52a3e809mr75159lfv.28.1689892637988;
        Thu, 20 Jul 2023 15:37:17 -0700 (PDT)
Received: from tora (83.10.92.232.ipv4.supernova.orange.pl. [83.10.92.232])
        by smtp.gmail.com with ESMTPSA id v13-20020a19740d000000b004fbab4b7d45sm408232lfe.67.2023.07.20.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 15:37:17 -0700 (PDT)
Date: Fri, 21 Jul 2023 00:37:15 +0200
From: Alicja Michalska <ahplka19@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: robbarnes@google.com, lalithkraj@google.com, rrangel@chromium.org,
	bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_ec_lpc: Add DMI definition for
 post-Skylake machines running custom Coreboot builds
Message-ID: <ZLm3G5G6/gmLZwkn@tora>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

ChromeOS EC LPC lacks DMI match for newer machines, which
use "Google" DMI_SYS_VENDOR as opposed to "GOOGLE" in older models.
This patch adds DMI definition for MrChomebox's custom Coreboots builds,
which we (Chrultrabook Project) are using.

Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 500a61b093e4..6ac993be4eb1 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -533,6 +533,14 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Glimmer"),
 		},
 	},
+	/* DMI doesn't match modern machines running custom firmware */
+	{
+		/* MrChromebox's firmware */
+		.matches = {
+			DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
+			DMI_MATCH(DMI_BIOS_VERSION, "MrChromebox-"),
+		},
+	},
 	/* A small number of non-Chromebook/box machines also use the ChromeOS EC */
 	{
 		/* the Framework Laptop */
-- 
2.41.0

