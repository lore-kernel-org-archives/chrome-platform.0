Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF008258B
	for <chrome-platform@lists.linux.dev>; Wed,  6 Jul 2022 17:18:41 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r22so7610908pgr.2
        for <chrome-platform@lists.linux.dev>; Wed, 06 Jul 2022 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sB4D1atBiaqKiCp+/oP8s6xiYE5LCpCI5LwUJJ8ZAKk=;
        b=fCY8LiJ7Lx7jGPLpVOBG/PzTDFDgBR2+M9TVaoeErF0JqtEPIe1ynbxpUZPBHrzehU
         fxqDJQ24s4M0Vrwsjd0Z3qhlY1nTgElpZtgdQpBMhvGAjXGZD4UQMz5+2nZ+Qm4LW2CH
         JfJQflXLL8BzEkNAshx3aFvu4kPdU/a+6Apeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sB4D1atBiaqKiCp+/oP8s6xiYE5LCpCI5LwUJJ8ZAKk=;
        b=z4Hpnr9upy+ezNWLE/NsKV4gr6tBu72jdqKwGFMSHFs6jQ1WHDfNgvgo7CsXKwL/Or
         QrNWWMtBj+Lg/OMNUIafRPvIq+UwR6lFCXW8sqqwqXtLpGhioDDcLSs/qJL3X+bZ1zvr
         N5/gKc157zMbvX/IFLmqKrZTe0N94DrYE44X1Kj1F3FTrjU9qehX4lOP68GI0dXWXfLy
         j+5DwCpdfS6BWwDGVIzvmSaZzvdQEpm6sB2X7PwQAJEcm1ZdiViHYwUPBeSfVJwv/vUt
         9SZXc97+7YpjNPAzpsjtHxJx0pv0p/LiB/PKeC4Q1FQUGfQEMAsLAYSr27tvtv6y3oR5
         lu8Q==
X-Gm-Message-State: AJIora8RhNONowKyNJPIopRq0Hac169kQeuJ9xc6VbTsRtyA/Sh0RKlf
	n11bpZ0As1c8ckHHvcxJ1v5ogw==
X-Google-Smtp-Source: AGRyM1vAFvh2Hyslk30+D+mp3QJUfmdlP6BYbMGe3W7KBUXLVDYIwgTZ55rfzR/lLX3w0CIIur+/Lw==
X-Received: by 2002:a65:4b82:0:b0:412:4346:f594 with SMTP id t2-20020a654b82000000b004124346f594mr15815383pgq.593.1657127921401;
        Wed, 06 Jul 2022 10:18:41 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:18:41 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 2/9] usb: typec: Add retimer handle to port
Date: Wed,  6 Jul 2022 17:15:06 +0000
Message-Id: <20220706171601.807042-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to mux and orientation switch, add a handle for registered
retimer to the port, so that it has handles to the various switches
connected to it.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Relinquish retimer reference during typec_release.

 drivers/usb/typec/class.c | 9 +++++++++
 drivers/usb/typec/class.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9062836bb638..f08e32d552b4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
 
 #include "bus.h"
 #include "class.h"
@@ -1736,6 +1737,7 @@ static void typec_release(struct device *dev)
 	ida_destroy(&port->mode_ids);
 	typec_switch_put(port->sw);
 	typec_mux_put(port->mux);
+	typec_retimer_put(port->retimer);
 	kfree(port->cap);
 	kfree(port);
 }
@@ -2249,6 +2251,13 @@ struct typec_port *typec_register_port(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	port->retimer = typec_retimer_get(&port->dev);
+	if (IS_ERR(port->retimer)) {
+		ret = PTR_ERR(port->retimer);
+		put_device(&port->dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = device_add(&port->dev);
 	if (ret) {
 		dev_err(parent, "failed to register port (%d)\n", ret);
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index 43fcf9e37a8c..673b2952b074 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -55,6 +55,7 @@ struct typec_port {
 	enum typec_orientation		orientation;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
+	struct typec_retimer		*retimer;
 
 	const struct typec_capability	*cap;
 	const struct typec_operations   *ops;
-- 
2.37.0.rc0.161.g10f37bed90-goog

