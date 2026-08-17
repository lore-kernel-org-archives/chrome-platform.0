Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189973CDBBD
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003708; cv=none; b=Cq4nkVRQXKIyEnXVaGiHwJdEuFPfvchcvgxqYcfReGtojce28ZfltxwWolTKBqbcmTj8FeAxhGQtbFPDJB4zQIVENzNpzIQ3V5oUvOqrpr3gmTIHrK9KlKqvPt5Tk6QVCUnnBHUf79Vpf1v1S6Xt3a1Ly7XuY25yFxH8rbx7l/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003708; c=relaxed/simple;
	bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhwwR9bQwBSb1H78MyNKToiK2aanmwEOPbVUv2iWlnVtsdLTBZrLkCVCRBaSmPH8NkbRmPCskcxaUblLpO75J6TzUH3KEuM22TZpZf1APAC/oxfnTSiyfWFPOzQYsp7npWJ39J4nDSjqqj5G5Ny8Uq0DY22Asu2piUL/X1NMv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=Xfb+TAY6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="Xfb+TAY6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1816815f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787003701; x=1787608501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=Xfb+TAY6DWG1niPuLfqb9OiTnqGd3f1JVksKOSouEvRduOBvoRl0ow8zxS5gGwvRsC
         xNt3BG6uQq4CerMFkRCiH4GqznnaILxQc6jh3m7HpmYSTq3LMUQYKLtYlY2wGnK2aOU5
         3U5ymZBth9CDperPktbnwHxhl/HdqM2B/1vm0z5IWjf3pT6MT0ZbgqEi51+rVSLVOpZ7
         VSxjjYvi3tDf3ANoJNPjiiNQM7YV4aFL7UGLBFOauo2J9NDu/U8x7u6wi/aulKFSxw9u
         yO7rYH2YAA8oIFuecSl9QRnx+VKjwd9E31+Fiu772hLQJ9Yp3gzhdy5LcgLzS5bKwMUU
         2jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003701; x=1787608501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=C4vjEfQ+vLFZPwcOL/bCf2pc//ppPkBesa5iq2bXIi99ce7pnkBHMP/3WScKCKk91E
         mgTtvhDXJGU5+YNxaxY060FwYZEb79TVzExQVmlRyyne5vGu8DjJoZrZKTZ/iSBvo5+o
         axzLGERV3SN9ucrL/ICWSguknjQtTshhckRDK9pS8+r340yo2l6+iSb6NirJo26E2zgA
         9K4ItS8+OvTUlW7DFE9NVjmgU+yDb+Ow6b+Z9OwPk4aSJtaudg6A0VhDcAJ0qmFnuyy7
         AgC0i1yBrzlSI32iX8iQTnxNAPYSSLGoK4b5mNV0y7XmBlLeBqFmAxodN6AZosM2zVya
         EKlw==
X-Gm-Message-State: AOJu0YxsxoNYxba4iFlx4QvRfqptve1b4UWCSiG3zgqxZ0LfYpyqAoc3
	56Jieg5ksWtpjFBYK+XryD9LpR6Dd+17DMgEa3EzjVAO1M6FNeW1raBPQ75TMKBvbFl59zgCujb
	smH4XDA==
X-Gm-Gg: AR+sD11BNuAZM+y2SRXRHWF5O17DUGXL2GoWnJnPNOatzR+hg2S4TcJ/3R5bBRpXnWR
	DWE87PPxqP6V+utP1WoDvVSPNGcwkU6DPDCMmTzlvmxZ5SgVggEWV+3oigRsxYu52OK8lzNVNgD
	bk6OLzA7iwr62ImJkWUsJ2xlSlgcNJGIJh1KBCrQsE5G3SSgb6HvHJZzq8ipkmBPf3puzU1AsgB
	PCJr66KajaCY2rX6JhG0kH54FHIN+phAYsgmyro4CP3KrYTN24kv9/+1rztN6h0HuXSaHFPBmsc
	+gUzkL8F/OrJ4LD6d1W9AAIRBUYO9wvvCoSKVxHf+ZDSHbCoiZHbEK5/adnhyn9MnqnV7efHKgO
	M8xcEVc7M7aoqLpc8wVfDpVXtgKPKb/Qs9ziduD7jHV4MEhHORPYWeMKNFGyynhAvuJpU5eBReG
	c5vOVXJLZxYJ1g4z2w9EpypUVzCFwbY75HL8iPJUlpq3Zsc99f6Q83OO+bA9RO8eyBBsiJ22LZq
	q+p3nIkN4jn9w==
X-Received: by 2002:a05:6000:4a01:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-482a8fe9b5amr6047922f8f.3.1787003701113;
        Mon, 17 Aug 2026 14:55:01 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b3f0sm6060954f8f.14.2026.08.17.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:55:00 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: chrome-platform@lists.linux.dev
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	oliver@liuxiaozhen.dev
Subject: [PATCH v13 RESEND 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Mon, 17 Aug 2026 22:54:51 +0100
Message-ID: <540bd3107a81da9555655ed2d5a9252ed04a620a.1787003659.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787003659.git.sean@starlabs.systems>
References: <cover.1787003659.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic coreboot firmware Kconfig symbols were renamed from
CONFIG_GOOGLE_* to CONFIG_COREBOOT_* while keeping the old names as
transitional compatibility symbols.

Select the new names directly in the arm64 defconfig so the checked-in
defconfig follows the visible Kconfig symbols. Keep this separate from
the rename patch so the configuration churn is easy to review
independently.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..32ec89a872d9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -267,9 +267,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
-CONFIG_GOOGLE_FIRMWARE=y
-CONFIG_GOOGLE_CBMEM=m
-CONFIG_GOOGLE_COREBOOT_TABLE=m
+CONFIG_COREBOOT_FIRMWARE=y
+CONFIG_COREBOOT_CBMEM=m
+CONFIG_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
