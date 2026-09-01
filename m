Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98D48CD63
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284897; cv=none; b=XZCY9/SSDcZl5uoMtcsI2QXJQ6CqOGr8F122cdwvxkbTB+J2xdmMRfEv6sTx2zTKWCvP4Hm2LBU5MuYCzcsQ0Nceqxo0igdQwixge5aAZaNcwQPFvIKKwR2rDX6l1cSC8P5GS9NxWVaYsbFGCd1BwTiaPhBnern3jFRLXPazwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284897; c=relaxed/simple;
	bh=vfQaj9ly6LhRgNLfN+7UahmQXADGA5101PUjRoWcTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3htxcxLIMW8Uyrh31ZpHp6Lc1PSZEyYBMaLOjBHzxP2H7aOa/tag9wQmNQtGlVebmWDKYeyU7bLCbtUyKg/+fdXyAzlvyYBgLrcd15ddkxy9SDECm19dr/pI/xfNZEe3EDrwlHLA2W+hCxAuyIfCgXCS3YRXaEGz3zVM7r8/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=mqnNQjVu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="mqnNQjVu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so509625e9.3
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1788284893; x=1788889693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=mqnNQjVukOSxfVf/9xLq45cwrc4CuSWPQTDzYgguNj6LXRFM3tvKv4QI9/GrSY/Dnt
         i6rbfGy7SEALWu8hmbpY2QurK8xHfJK9g5KwyGiSiBgvdH3HT0g2R1wOAq1UbI61lD9d
         u6YG+D3gYZ2UQKyuhYQzC2QgNm3UV7V8ERvA/zpkL8OIZepzw9OdGKNaobG1iymRvzqO
         KGd/rWhYmw1bEw3viK20Op9Jp0qPlU0qnKzc8+MMOx9uXeWqsWFGfaTDMjokmloeJ0W9
         AsGVqxDEhdiNAYCoXYIwgmogo17SUJx96gAksZfYDObhojyOBaB7NuC8/QZt1dWxXq+/
         bXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284893; x=1788889693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0l43AVlC6vAtGNyUJOGdQyBhYz3ewWV5F6wFrMVKpks=;
        b=kijqFhBA35U98x7DyQWYQymIbDjy3/zWM4Z649NBAnzOJHcGmBx7IqhAWI6xD0MaWg
         w1C6L5HbMDfJ4dx4FME9DKe/6ivl3NbASO7lDNmbpAO5rXAZs2Gy9kA/OBjxTnGPtm41
         +iXplMVjFTHklEDZjxVXKZz7sH9bBuTFod/m59GEyG4x9JrCZXUOGNVDXn3dUQmdgGE+
         /oQHCb/uLX2Wo1eWOOsLMuv1oFqWFPrJJgweOEfeNsTbrATJ4iqnBnMLJMMjSvAwIoXt
         VHwHn99I2ahdR5JigYCVmWeZBE/BfzP5x2jek8sb0NI5DmXkEIncWNywZ2PGmg5jwp3r
         Fhvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+y1A5SdBRksruKWQiE2Nf359PXiHZC8QQCfBUha+qhxgMY+aCEHZZ9BPuOhQUREKa0f6+SICyynpRiCMRg9o=@lists.linux.dev
X-Gm-Message-State: AFuF++moDwOsElOaWM44RAnK96WV10pLSO02rKy+GpdcaZgNQuh1uHMA
	2qAh6o58T5gQuBYjCDtTB4Y1nkS5flhuzoPES6h3k/L+qDp5pcjsySHuOsnCdnRCYw==
X-Gm-Gg: AR+sD11dDLdC9sef4H1+baq6b5p5v9Yib33fDAujVLNKRCk7qn6GeHpJxA4WZMWqlnm
	cDfqJuEZWIY6yA88jDGS656e42OXtYGZ+PWr6rlIuogCKmCJCGwoKT52NLjbSwhI+k+LubxHJum
	JZu0ceFKwpoE53XkBJMPBk9VwefHhGwVLRo7V14BRW6kUM4ermeu/2sP7sFesNN39X9embAGKVQ
	vrXlRBSlux2pjwJBd7zyb1zP0+XDHOyPd9t1VeDBJ2RXUJBu5fQaN7NKK+9SWk3p4BtCFlufQF8
	eUsOOeBAlo3ZBtVPKzHIUkYiWGgFRUxrqH2otVeDxFz+McCYhIsFBfbqe/ZjRQ/p8nYuFAuMvGH
	4/qR2BO3WDthj8yryMFKH9qO00bKagaO4xYj59nnYSsjx6g/EKY0O54aP/6UJbjmPyIaoHha4Rn
	74233vK/1wQGbrPxMNbDYzUBre+IzdIfTLSQk5DeGgxGNNNW0CoTxFMOBwjrTWZOz+vMQBtMyvr
	2t6ZlX08ruBnoQ=
X-Received: by 2002:a05:600c:4512:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cdc14d69dmr178611345e9.3.1788284893038;
        Tue, 01 Sep 2026 10:48:13 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm2369225e9.14.2026.09.01.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:48:12 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Will Deacon <will@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	Yidi Lin <yidilin@google.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	chrome-platform@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH v14 3/5] drm/sysfb: Update coreboot framebuffer Kconfig symbol
Date: Tue,  1 Sep 2026 18:48:04 +0100
Message-ID: <1748b8899ec772cc435dc57dc55f76c15da95f0a.1788284852.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788284852.git.sean@starlabs.systems>
References: <cover.1788284852.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coreboot firmware directory rename introduces COREBOOT_FRAMEBUFFER as
the user-facing symbol while retaining GOOGLE_FRAMEBUFFER_COREBOOT as a
transitional compatibility symbol.

Make DRM_COREBOOTDRM depend on the new symbol. This keeps the DRM
dependency aligned with the renamed firmware option without changing
runtime behavior.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/sysfb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index f7e48178885e..2bfcd59bfe6d 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_SYSFB_HELPER
 config DRM_COREBOOTDRM
 	tristate "Coreboot framebuffer driver"
 	depends on DRM && MMU
-	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	depends on COREBOOT_FRAMEBUFFER
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
