Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0EC1C15
	for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 22:06:17 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id x66so7023352pfx.3
        for <chrome-platform@lists.linux.dev>; Tue, 22 Nov 2022 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2cfSN1kgZzRzJ6XKptvh9cmk5InXjmHdGYFjwKt+CY=;
        b=Gf538M7G4fwP+edrCEnC1Y2/ZGyZwVr9nyc+6qCo64Sw5Ip01KNmQoCWjbabYRgX0Q
         e1bqKvuoxHFYptZnI1X7utko1R5diccxqKmhigd6cixmgSnesF/kGYZ4QnN8BftRlN0Q
         e++I4Ob8oO8dtXbSw0sP5PdtW7aJEzEVZYAII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2cfSN1kgZzRzJ6XKptvh9cmk5InXjmHdGYFjwKt+CY=;
        b=TKWH5C7k1NIVRxpn7BNfxv/cChW254IIKqXaaQWEgmsvlWT22SdRK9sccyu+StzGvm
         O6/0AW4NNnBeo3dKiPeguIe8cmxTgTqOvZ2cBjpul1QyXAPBWiSI/8islqykazgS1ZCS
         LQuaqwMAlEgbYfuMq9YZ51vMETOPooc+oNvoWIppuQsLb5NxLGNJcCEi/Vx963ZDSJLx
         FLjM+umvxB7nLTCPuzJattAsZllzuKThtbaMN+hc+EDjZdfdWnB6fL76mPO2dKwMD41s
         M91003fez8mAr5Y7u+llkJmNkwPg56CqlsZ6QGqw4cV+5tR7zySqOJ+x4t5zWZzkd0KT
         TMdA==
X-Gm-Message-State: ANoB5pkgMkXqC/5IA9riVMr5MEN3IgxiM2C7P+jsv8g+nh87Ofg3Nwzh
	PJd7E/BwvY/31GXrvUed+FwYXCtFaA39fQ==
X-Google-Smtp-Source: AA0mqf6EwM9Hd8/cnPMD9sYsgVHpc52kVnzKPkEeBVdjtRQRTPfKkOsTCHxgYhVmek++4mJ2UPxcyg==
X-Received: by 2002:a63:5724:0:b0:46f:9c0c:8674 with SMTP id l36-20020a635724000000b0046f9c0c8674mr7692092pgb.26.1669154777162;
        Tue, 22 Nov 2022 14:06:17 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:16 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Set parent of partner PD object
Date: Tue, 22 Nov 2022 22:05:37 +0000
Message-Id: <20221122220538.2991775-3-pmalani@chromium.org>
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

In order to tell what Type-C device a PD object belongs to, its parent
needs to be set. Use the Type-C partner USB PD registration wrapper
to set the parent appropriately for PD objects which are created for
connected Type-C partners.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Use wrapper function introduced in Patch1 (v2).
- Update commit message to reflect that we are using the wrapper.

 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..d5bc4021aca2 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -968,7 +968,7 @@ static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
 	if (!resp->source_cap_count && !resp->sink_cap_count)
 		return;
 
-	port->partner_pd = usb_power_delivery_register(NULL, &desc);
+	port->partner_pd = typec_partner_usb_power_delivery_register(port->partner, &desc);
 	if (IS_ERR(port->partner_pd)) {
 		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
 		return;
-- 
2.38.1.584.g0f3c55d4c2-goog

