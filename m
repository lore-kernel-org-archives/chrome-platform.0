Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271901C15
	for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 22:06:11 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 6so15194739pgm.6
        for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 14:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTwasftcYWGoOTE8NtdjlLPhFZo1K5FqzfQnri8pWqI=;
        b=MsUJ2I6a4ufk8VL80LUg7X5dz5P321MFBR9qAYp30CBw34Zi5yXn1JbMB8zoTZH/gF
         /vsTmHEWlIPIv7UADILPslwaI1eenMfK56llyah7PRD2FOw3ucNeO+1NeLGaElmW1ykU
         JgzwzMMkr+ZM/kFNBtARIq6ALHXvreLLjKKUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTwasftcYWGoOTE8NtdjlLPhFZo1K5FqzfQnri8pWqI=;
        b=ZpreA3R9gZHdxZ5saj8VAFmzAjKHssi1ySW1ZvY+QqZFNcuWlXHQXfCavwv5ExpDfq
         3JDx8/Rx7qNszP58hIy+OdcXb3+Cb8vrW4VBOJYCvSs+XMGSmIzHJSC70YLEHb++VVZx
         t97x7x3dIg+itOwhU3Iq1lcxqF2k3HkM8HWBZZoOfjrVJo/XsL/Ze4/BZ1thkhMEjuO2
         zlwwuJuxZ6pjDogcNv5509Gg5peRq0VFwI6jIsZF/wDV06Ul1HxeJX4Zh7Ek+yME4w9Y
         TzCzEogHsKvszvln+ETVZ23ockS7lxVfLzOdXN7Lki9oxhMHt2EJ5plX5Im40BmVEhLK
         zQQQ==
X-Gm-Message-State: ANoB5pk16TSewOk24vqelakfi4mxHa68IBNQrx2kNdWFi0VDtu9wJm4h
	sQRJUVoVbvovfk4QPdCX2PmKoFWnt8L8+w==
X-Google-Smtp-Source: AA0mqf6IASzDx6pIfEcciVvIvI7Vqy/uQHA9epznnO2/2iUSYy8BgdxIjZtO+aSu/RHhtUPo9hVpww==
X-Received: by 2002:aa7:9159:0:b0:572:24c7:34da with SMTP id 25-20020aa79159000000b0057224c734damr5946459pfi.73.1669154770592;
        Tue, 22 Nov 2022 14:06:10 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:10 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 1/2] usb: typec: Add partner PD object wrapper
Date: Tue, 22 Nov 2022 22:05:36 +0000
Message-Id: <20221122220538.2991775-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221122220538.2991775-1-pmalani@chromium.org>
References: <20221122220538.2991775-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some port drivers may want to set a Type-C partner as a parent for a
USB Power Delivery object, but the Type-C partner struct isn't exposed
outside of the Type-C class driver. Add a wrapper to
usb_power_delivery_register() which sets the provided Type-C partner
as a parent to the USB PD object. This helps to avoid exposing the
Type-C partner's device struct unnecessarily.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Patch first introduced in v2.

 drivers/usb/typec/class.c | 19 +++++++++++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index bd5e5dd70431..5897905cb4f0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -821,6 +821,25 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_svdm_version);
 
+/**
+ * typec_partner_usb_power_delivery_register - Register Type-C partner USB Power Delivery Support
+ * @partner: Type-C partner device.
+ * @desc: Description of the USB PD contract.
+ *
+ * This routine is a wrapper around usb_power_delivery_register(). It registers
+ * USB Power Delivery Capabilities for a Type-C partner device. Specifically,
+ * it sets the Type-C partner device as a parent for the resulting USB Power Delivery object.
+ *
+ * Returns handle to struct usb_power_delivery or ERR_PTR.
+ */
+struct usb_power_delivery *
+typec_partner_usb_power_delivery_register(struct typec_partner *partner,
+					  struct usb_power_delivery_desc *desc)
+{
+	return usb_power_delivery_register(&partner->dev, desc);
+}
+EXPORT_SYMBOL_GPL(typec_partner_usb_power_delivery_register);
+
 /**
  * typec_register_partner - Register a USB Type-C Partner
  * @port: The USB Type-C Port the partner is connected to
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 7751bedcae5d..8fa781207970 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -23,6 +23,7 @@ struct fwnode_handle;
 struct device;
 
 struct usb_power_delivery;
+struct usb_power_delivery_desc;
 
 enum typec_port_type {
 	TYPEC_PORT_SRC,
@@ -327,6 +328,9 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 				    enum usb_pd_svdm_ver svdm_version);
 int typec_get_negotiated_svdm_version(struct typec_port *port);
 
+struct usb_power_delivery *typec_partner_usb_power_delivery_register(struct typec_partner *partner,
+							struct usb_power_delivery_desc *desc);
+
 int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_delivery *pd);
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
-- 
2.38.1.584.g0f3c55d4c2-goog

