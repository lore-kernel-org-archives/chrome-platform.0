Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7628DF1D
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292792; cv=none; b=OKYuvwQFLyHRn1x2TOXK8KDcMkYz1M6lZa6boPe8H/dYcIj13LKd5hbn7xMhTOM3IwA8XwTa8obwtaFXG7zQAxiPhan1kjsu3uggTOjzKC8YqkG+K1HJCQVHk0f2RePxxhk0CMh/O5r1XKjUZArpeR8fnX6DUgQgnNdtxBNiIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292792; c=relaxed/simple;
	bh=9YO6vTmmSzYJ6+ilrVSIaHhLFOqDRbwDZf1V4ontcm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIPG/80bBBvYVG05hN1u3OceogWNw/fkidjbndAzhvrv7U1LZfcrXgpdMctrhqJF0x+WzrFN15iEdO5utGOEr/YyGo0tbcRikwA0IFyJpI/SxBv0MQrlAVlFJ3NekGbYA7rli5F0WDQcJ+asjttCB9T95u+OzV3uCmovpInPd1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CCMH4ay4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CCMH4ay4"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0d7b32322so363508066b.2
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292789; x=1751897589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC8cr4prgnEYpYc0c9MsVzaUXE6Rfq2YIvUMxEgcago=;
        b=CCMH4ay4fQQ2M5iqts5Kop6VKu1monUBGY2ibHjwtlYHiRBxdynvfIJHLsfgdX/VvJ
         ZGgdM2nnd2MM2azGe1aXXEjJKLe+NVy+12ii78YTURuNcBunJVCiFXwS4lgnsg3M6nrc
         LzBZlTrSFK8YEVuGoZ3oHLBuo4g6rDIbDQT58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292789; x=1751897589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC8cr4prgnEYpYc0c9MsVzaUXE6Rfq2YIvUMxEgcago=;
        b=AMtQeAcLBesOfRhRSlEd5tC7DgRNThpqNCqto8oh+ZxyRLqqh3igehktOoWqT0Ivmt
         JDvWNtjb5dzBlZyAgdK3EUuce7vX89gVP5dPWvcH5+yxTKixynoEpBxW9Zkj99oEOy46
         P7WRU4zeFy+vKHuzfEnki9M2BkEuYjnVlMGCf8fj9BFoAi/aMVS2qUjmSEF+SLGub+iX
         EuXN0ZN4QgO+tXBvNOKQ6B3eJ5P6fym2o2ZoKNRGcT6CKzXR8++NapFI8OFs7oDd+OtT
         GCfkMvQsrky0BGHPUkwqBUAGghTNxIrQK9osH68hFRx/zX0JrqhTJF3I3kRk4OHfQSmj
         G/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXREjOBMIsVLcYv1Z5kvdYaSRkyZ6OgVKtLPi+Kc10ZHWxqsgD1kFfOtJfOLSp9jYwkjOOiI0qjCfbRz/80JIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRcGL7RloIyPKUHybjvleJPGf/ZMAWNriAAjpRT6p9rpK1RY/j
	Gy0rJi5SPMILJmuVMPjdg6hFChO4Ojvr7JRguLHBRng0i7cYP4FXPOgeo/3QYOx1nA==
X-Gm-Gg: ASbGnctOQx0zA3RFZ2Tkecnh3FB94gkdoJkraKlyfHiqS2YoyUKvGYOntFY7R3N7sRm
	vPYmNQs1aU0CB6p2SW3DRHfuyTimpHpOnPPUb49VKFLnAsN92PwwRf15lvzsNz5yvjDhp3CS76H
	KoK2PU1IJdRVyk4BaTcKiyVomodCwHfnKBVpdXH19YTlNMMGRQrl+wBKtsKiYIPoz7dcj59IArD
	GwCtv5yvH6lFpQlNKa2wcP8lObnIfG5dpfutGAvuKDYkwugSR34YX2EcbnuIIz9kz0DCHnEPbgk
	NprJKvP7D2hZ6j9k3My8C/T2La28qYEZKDbnyimy1HXx43ORNzc9MB1r/mpVS2DW9BlDfRX5YEA
	jb08hr9tAzKjRx89zC/9g6J2LInflMQLI9p0FuXkwQSUpGYYJSI6M
X-Google-Smtp-Source: AGHT+IGAPr4AL+m9Q53Is3hbLm4DqSgPBqlFVyHvgBt7nn+yWfXW/dahX7CBUSLpmXWeZqCzkyRaOw==
X-Received: by 2002:a17:907:1c1d:b0:ae0:c803:c96 with SMTP id a640c23a62f3a-ae34fddefb3mr1305940266b.24.1751292789206;
        Mon, 30 Jun 2025 07:13:09 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:08 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 09/10] platform/chrome: cros_ec_typec: Report USB4 entry status via callback
Date: Mon, 30 Jun 2025 14:12:38 +0000
Message-ID: <20250630141239.3174390-10-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4f338771094..c5a7f42ffb5a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,6 +698,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.0.727.gbf7dc18ff4-goog

