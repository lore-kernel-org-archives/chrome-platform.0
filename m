Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7875466B
	for <chrome-platform@lists.linux.dev>; Sun,  1 Sep 2024 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163633; cv=none; b=S/BOc2axNV4JhyJUqOvuINvL0WDN9zyrOs3BRezkPl4iaCpGT9eX35Sq8vSvpp16R8qqLcQluBx5uBh5UVsZiMosDF1QMl0aHSKrC3QtDO91/bVUj94mC1Nj8RM1Rj5+wQ9xcffZA91NlD6bIMgnUPwj/BQv5X8K9n2BOxHp/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163633; c=relaxed/simple;
	bh=lQuo9VmpRTMEUSypDAVnMcCD781MhPSwWoCv0Ud9eec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjnBrpxxCxLRygqbQtLW/FbX7nYc3l3xt5212gIgAOIgoyM3OxH2Ohmqwk4ddR2BAvSU+94i3oX90ysR7k7lbyqacCDQGKYn32ikzyX67qB7Ol2omiJ+bXLl/f0I9/JEramQRDEcLs+MFrwY2yQV+IAEaTPVmzLOcVTxGGyrBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jnwhX303; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jnwhX303"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5da686531d3so2090641eaf.3
        for <chrome-platform@lists.linux.dev>; Sat, 31 Aug 2024 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163631; x=1725768431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
        b=jnwhX303TGFW2007gErdjpq03h97xDx+3mbFhHwR3HfJ1HmwJxPaWrk0hXr0Vyuvos
         YA7PSj/cuo527CB2AV7H/5XCQ730tF8tB9++reMC61u5KLcb8c1fhcPjtC31894Ct/Qd
         sqxB9U7hDEcKLNHt+Tp4HHcj13mbppq1lN/Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163631; x=1725768431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
        b=BeCvLMDpV4FLltt4dzXGCWSpPE4bdKzwvnKKgM7/ZO1pw8ZKgaQ+S/S8fXY5zHzfOy
         NOt9qXsZpV0WN6FY9eZFzMi/3uRewz1RnupeSsEwFWMrgkSmUF+vSCOui56IaE9RtfPB
         Si15L9Vl06QYOOpRoWy6AocmoqijXTV6dnnOb22joLr90rpPCA6pPWwHc3HGHtFMnEts
         Q2BlhTU7ajcz4dFkg7bj4cJLVzLZjBjR83SzQvgu6+/sqBM/H9GSFpjtgard7Owm1alR
         +S/mYrUdy1SCGr7ZlBkRKZCd27kwNOvar/nSfRs4lgUZi9ITXwQ50vCEnNXtzSQ9ySCA
         Jd8Q==
X-Gm-Message-State: AOJu0YwioWX8Jff9g8Il3Z7iyoS0gMsci0pb9yvBIOm0+R6vtNvAKw7F
	dIewt6i9EDOCj+CjdioOZF5npvfTy63ELuoyi+mqLcsCVlWd68gCgFT8CtCNudohWet65KNw8UQ
	=
X-Google-Smtp-Source: AGHT+IGn0G5AiONQD8K5yi4LzBmU8yqa6VFEQOeNXV9U2Ho8xKtvyvDtSksQxtqrZ7RRI09TCw6qDQ==
X-Received: by 2002:a05:6830:7310:b0:709:5601:abea with SMTP id 46e09a7af769-70f72bb320amr3883433a34.10.1725163630581;
        Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7d22e77a7besm5341681a12.37.2024.08.31.21.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 04/18] usb: typec: Add device managed typec_mux_register()
Date: Sat, 31 Aug 2024 21:06:42 -0700
Message-ID: <20240901040658.157425-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify driver error paths by adding devm_typec_mux_register() which
will unregister the typec mux when the parent device is unbound.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/mux.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 49926d6e72c7..db644bec862c 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -457,6 +457,41 @@ void typec_mux_unregister(struct typec_mux_dev *mux_dev)
 }
 EXPORT_SYMBOL_GPL(typec_mux_unregister);
 
+static void devm_typec_mux_unregister(void *mux_dev)
+{
+	typec_mux_unregister(mux_dev);
+}
+
+/**
+ * devm_typec_mux_register - resource managed typec_mux_register()
+ * @parent: Parent device
+ * @desc: Multiplexer description
+ *
+ * Register a typec mux and automatically unregister the typec mux
+ * when @parent is unbound from its driver.
+ *
+ * The arguments to this function are identical to typec_mux_register().
+ *
+ * Return: the typec_mux_dev structure on success or error pointer on error.
+ */
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	int ret;
+	struct typec_mux_dev *mux_dev;
+
+	mux_dev = typec_mux_register(parent, desc);
+	if (IS_ERR(mux_dev))
+		return mux_dev;
+
+	ret = devm_add_action_or_reset(parent, devm_typec_mux_unregister, mux_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mux_dev;
+}
+EXPORT_SYMBOL_GPL(devm_typec_mux_register);
+
 void typec_mux_set_drvdata(struct typec_mux_dev *mux_dev, void *data)
 {
 	dev_set_drvdata(&mux_dev->dev, data);
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index efb5ed32b813..08431f0896d5 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -99,6 +99,8 @@ int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
 struct typec_mux_dev *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux_dev *mux);
 
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
@@ -123,6 +125,11 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+static inline struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return typec_mux_register(parent, desc);
+}
 static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
 
 static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
-- 
https://chromeos.dev

