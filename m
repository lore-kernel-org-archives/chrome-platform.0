Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC7439F86
	for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584164; cv=none; b=Ey9ideEGzg+aJ4Z1YqRSBVVT/9wjCMxgMZH4Ys4etj27NQKeH+zdPiOGxsvUS5a5298QaNlNzGvZHsOEG32FIH22RuD0jT8QiBARMoD8ET/XvxUCf1ZrUJ8qFhvfNMEWyqvDfku39UOT2PED8uupLBypk3aPCn9RYGLGjPK47eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584164; c=relaxed/simple;
	bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il9soDhdPuGZHzLOxrbVBHJfAe7nlOnUjIC+ZEG2mFsiz0uc7zqUMMb5SDEHFzZfbPuKpOlXWsGu6MxFOlxiOA09nG0RV1iF57uYt5YCUDhgu2Xb1a1gumPrYtA6P480fMop+Gsy2T/tcn3+omMTZo4A6GLW9NYOpzZKWSVL7Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=BQji+ft1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="BQji+ft1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso28323615e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787584161; x=1788188961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=BQji+ft1AgDFSqUfuXYv8XwYFknB1InOpaSJi/dLGNAI/h/B9nbba//iYSP0aEQEwz
         6mZKYZ5nV9J1xY8P7UVc/R55iX8pqqGHf9OVlFr7nigU88U4eRKp5M69k+7fmnFtL78W
         q0/vmR1sNE8mbLikcoWhBeZWzWqEvgqHKgXD4igVcxJnAs7bkhSuauHR8frvp4LnZCfF
         0N9tvsCbOyaP9mNuz1OW5KQqzYgGDxzB+rxbbMDaG6gfLegBTNUMKfkfgdjavOLvtbyz
         Iwv89XrYeabvpvbwTsueTcjz2/WpuYJKyNdO1Y/LzeG09T+/e+RqGtPUdWWMeHIokxST
         PCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584161; x=1788188961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waubqiuCOYRQ2QTo7ozti7dFGxycb8EqFHbDI6qm6Lk=;
        b=Zb0q0HA2RWEMiSkVwEpcX9IbIKyLT1PbuUlD833jqaEB6KaXrM30LCyfTA+wZjD2FV
         WhXuwckSqnBrer+guDC6gvH+s5JZAyNaP+xS/bc5MHvL4KC6KK2wjEmpGwePBL8YxdBf
         l475hvVNi9VkmaVIXZAK+5D9HK5BZgPERj+ci33UQPvzZOv6to3MPzlWP2La9dkjo0VQ
         X99AXFENL25n5TXUmHJ2/9u9ZmBgNMXlivXX7Sw6KcwENDzEbxEUWzV50idLp5xtUicP
         r3e+F1h0a3oFx2O0fj1pwNyzcOGYVxHFpKAx3kU7ZDaE6uZEzFNnWGVsfIndkyk3Lta6
         Ej5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfOslBUgrhwyVxmiXwlrVcNp4O3NjCouPC8f60RoVKyJIrfURs7vnTLHVFRiLVg2EoS5esiDU51Z4Bwni+Cxw=@lists.linux.dev
X-Gm-Message-State: AFuF++lyhFvluS7IxyC3IJ39H9iSvsWJgCB+Ksoo1iS/oskc1TqCCZdY
	D8suAuKYhu0BRTIl3m7BHSRLh/UASXvg9u5wLiyFP6xaurvTDj98/zzQIdY3z+wWpA==
X-Gm-Gg: AR+sD113PMgLhtl6yBpYeU/td9BYtm8WRRUe91h0jJ5tpbEXhL7LMB7eDmxFEs7OpBC
	ksM5vQwZsIgAAN18E8RWB+Iueho9DRtZLXWJREHcMZhloi9TPBB7rkMC7GhCwe5Lov7AxL7gIAf
	dUy51zn/XfUqNAJaLQ3QbCzFuXW8wB2OsPqSx6BXt0CeP8fFfykM0RfE+eyvHLghVo8pcEilImW
	Lh4nZA/EdDVgoomyhyKuhrZjDMW9RVphfLlily72iOH7R2Uuewz6b8fr0GfwxLldP1zWdxwZaAA
	uW2s+T4AJGs2X62xztR2HMNdiERHcQ41JW1AQm2wxUMdEOANMdzkSfu60WUHa4USjXAbdg51Z5m
	UuZaHneBvHil7lbKtD2YzF+9lj5xYpJ5HTLICH+kI0xjDb6NDyqN1B1IuYXnyHdNtJ3axbZkQyW
	2/qRzZ/BiAViK2JH057wDGQKgAIF7JW54zlmvLZddvU03mvw50uTrXsN8BqYomhKzr4YVu72hsd
	sc15SkBJFAcHrqJIWM8A+soOtps7IA=
X-Received: by 2002:a05:600c:5294:b0:499:8ba4:8cae with SMTP id 5b1f17b1804b1-499b830d665mr374268665e9.1.1787584160350;
        Mon, 24 Aug 2026 08:09:20 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c8f382b1sm63920035e9.8.2026.08.24.08.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:09:19 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
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
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH v13 RESEND 5/5] arm64: defconfig: Update coreboot firmware symbols
Date: Mon, 24 Aug 2026 16:09:02 +0100
Message-ID: <540bd3107a81da9555655ed2d5a9252ed04a620a.1787584107.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787584107.git.sean@starlabs.systems>
References: <cover.1787584107.git.sean@starlabs.systems>
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
