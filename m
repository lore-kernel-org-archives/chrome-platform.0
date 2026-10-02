Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B0D51589D
	for <chrome-platform@lists.linux.dev>; Fri,  2 Oct 2026 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971277; cv=none; b=Mq3aKgOyu8vY/Z2S/Mkv2xRS9CzpzYAIe6jdUB6HStue8D3VdKhcrAeE/z4iSmJlJd9u+sDEBlbldejTpSQSRSkd0iJFqF/JcV6Daq5T5xb68A+nb0BX3UX/zo2XwcVP7QwOeuoIQJAB5+oarDtJn7waWdwyflXFcWDtaiotLxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971277; c=relaxed/simple;
	bh=xYd3Pn7xwPntUxM1xr+2z/L7TOcW6nT3FOYomMjm6fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LWuWqPBWzt14wZ8+R4Xij7b51B6eJP3BE8x1QQwwUQ9oRMvKGqHj1Dft5xyCm6jG9b0bo2i68PivpmPxuok+piSfHyxOJ0FDN8Q+1u+DKMAuDH88Zao7gKQDEYOp93c7l38p17IYxBb/9Z6Ka8e6QuiTZx7KeZwNl/BOdY0S9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWezHWCu; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWezHWCu"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93e53145964so79485a.1
        for <chrome-platform@lists.linux.dev>; Fri, 02 Oct 2026 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971273; x=1791576073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWKhQl8VCZeFEKO2nQY2AimaMpesWlwedfHQWqbVEAg=;
        b=AWezHWCuVmBbXM+ZP6Y4sqKtcCmCGWSSx7+4lDOAihAY2M5ZQ+OZNgAVbJM85fLm2Y
         tvi28RMkkGD7OkrKgLeD/KKKLPQGmAL+cGvA8NvujG8iNFa6bniHZ+wtGmvjmMOyGAt6
         f4ygRU2redxvmkpWs5jbQKQkItfM7KDPWGuds/2blNSwJn/eKdOiUI3UPIm0u9oz+Tg6
         2ArUH+V3OHl/DvlZeznm5FbC44Zcm3nNStRWi0BqwaNccVzXnwAJQZArTxzVFFCire6E
         3n5hadQW7GGPXRk37CcTDUy6Xq4sRhqiinvBcEMQIGakoMowQ4ffHAQc4smDpNhvB8AJ
         rJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971273; x=1791576073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWKhQl8VCZeFEKO2nQY2AimaMpesWlwedfHQWqbVEAg=;
        b=a9Ul1oaUAtQrrJqdpHO8aJHqSr5Ax8u7A/cDvhDDQMZpQqunKwRgdHY6adn79Co66z
         ev1LYLa3xpLmRyqmOw5KXF8T8rVQzwRnJWnJQjbHnuYxiqRAe7GD4x7v+/AYU9IrAXSS
         1mDj9/l47JcKKF7CRbe5QttlKpJDYX9B/Hceb+bVJVY6cudeEP0j10wpVSJNYXTkpebc
         lxx6mpU1rHT7vFzCYWliFfo0M33bw+z3xDsI+y2MRs5DFvzBPVbebjhP4GS0Gg0vGRqZ
         j+P82bJ5UlzHXXWpmLth+mZoc+qkTfHD/wxKo3AUMeA0yG3gcmKRjJAoANk6ZXD0EW/F
         9rdw==
X-Forwarded-Encrypted: i=1; AKwUvBw8e8J6emAj0Ua+AFKCQWRuQhmynvJMXDvjWPm7Now6AYNEE2fMnL4Qnnw3+w74KEDY56X5c+EoT0AHtOFZIyA=@lists.linux.dev
X-Gm-Message-State: AFuF++mYrtMTmoYYRlzIxVuH3/b2twBP/VMdfgt558GnCyDUFzx5DWdp
	xQUvekiss2StEonB3RH2GhEj8KY5PKIrd0h26/R81Qp/f/WFupHAmdg=
X-Gm-Gg: AYBFou01ZdjJHZvGW1k40rU5qxwYAcOmEjigtduwELHutZQ6ZXPm5v8nE2/MRNIy8Sc
	VFwLe9MrG4ErRg42KJ3YUx5FxnYO60BY0YyBSFJgtqvoXLX/QcwSUIR3m4Moe0Zl02S4RYaeS4c
	WvCDdONrfrSOE9W0BztEUfGORrb5A7+lEXSjeIkrKbstZsfvcBxihu1Jaj3d4G5HlV1z/WeoFCO
	RXhAz2stPauuycHIIIUogmea+Wxi+Gta4PJhr34wL0CSYQ1oHnCspLw/rMHavyo1cs0fkiqNCz2
	ut/QFSC+Fz9BtGKOHTSlJKDRefY5wLZbSaYreXVPRXGX1AN/i1ypVfGQG10YiNkq4iySBFf7557
	8JgNXamUTGQ9iFWnLUPDKp2U6MOAm55XRRvgstaaxjDT+dp8Zp/zsXV7MwnmgO2VQx/ca2Txrbd
	bV1je2N7A9F0CbBX+B59mEcPBAlVlBPl3Dv7xqYUJEk3iB0B/wAwgTVrzp5QBvz5R9gGa1wLurt
	jcZA1lZRWK2LRpcPAoXWUgyIvVomgQGn2yXnwlONsEnVUDkq5/WhStFNuUHydDwWgDcudou6U5Y
	6k7UKjVdkSnLWtm1ZGgTZhov9J2L
X-Received: by 2002:a05:620a:688e:b0:93c:58bb:7214 with SMTP id af79cd13be357-93cf19db19fmr657960985a.31.1790971272471;
        Fri, 02 Oct 2026 13:01:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca21d8fcsm309147885a.26.2026.10.02.13.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:01:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mhun512@gmail.com,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: Stop altmode work during partner removal
Date: Fri,  2 Oct 2026 16:01:08 -0400
Message-ID: <20261002200108.399258-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
responses. Partner removal and port teardown do not drain this work,
allowing it to race with partner driver removal or access freed port
altmode data.

Disable and drain port altmode work in the common partner cleanup path.
Partner drivers can still queue responses during removal, so keep the
work disabled until they are gone. Clear pending response and DP status
state, then re-enable it for the next connection. Cancel the work before
unregistering port altmodes during final teardown.

Allocate list nodes before registering altmodes so allocation failures
also use the common cleanup path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Quiesce port work in cros_typec_unregister_altmodes() before removing
  partner altmodes, covering disconnects and discovery cleanup.
- Re-enable work after resetting pending response and DP status state so
  port altmodes remain usable after reconnecting a partner.
- Cancel work in cros_typec_unregister_port_altmodes() during final port
  teardown, following the review suggestion to use cancel_work_sync().
- Allocate list bookkeeping before registering an altmode so allocation
  failures use the common guarded cleanup path.
- Drop the v1 Reviewed-by tag due to the reworked cleanup paths.

Previous version:
https://lore.kernel.org/all/20260917204209.97699-1-mhun512@gmail.com/

Validation: apply checks, whitespace checks and static source review.
No build or runtime testing was performed for this revision.

Remaining review point: an in-flight port active sysfs callback may still
queue work after the final cancel_work_sync(), before the port altmode
is unregistered. Please confirm whether that ordering needs additional
synchronization.

 drivers/platform/chrome/cros_ec_typec.c      | 27 ++++++++----
 drivers/platform/chrome/cros_typec_altmode.c | 46 ++++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  9 ++++
 3 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7bbfbd888ca919d678d4c75237c26..2d6cbb7f51445fde4b4e8339081e921a9a143a92 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -282,11 +282,19 @@ static void cros_typec_unregister_altmodes(struct cros_typec_data *typec, int po
 	struct list_head *head;
 
 	head = is_partner ? &port->partner_mode_list : &port->plug_mode_list;
+	/* Partner drivers can queue port work until their removal completes. */
+	if (is_partner)
+		cros_typec_altmodes_set_enabled(port, false);
+
 	list_for_each_entry_safe(node, tmp, head, list) {
 		list_del(&node->list);
 		typec_unregister_altmode(node->amode);
 		devm_kfree(typec->dev, node);
 	}
+
+	/* Port altmodes are reused when a partner reconnects. */
+	if (is_partner)
+		cros_typec_altmodes_set_enabled(port, true);
 }
 
 /*
@@ -366,8 +374,10 @@ static void cros_typec_unregister_port_altmodes(struct cros_typec_port *port)
 {
 	int i;
 
-	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++)
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		cros_typec_altmode_cancel(port->port_altmode[i]);
 		typec_unregister_altmode(port->port_altmode[i]);
+	}
 }
 
 static void cros_unregister_ports(struct cros_typec_data *typec)
@@ -901,24 +911,23 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
 
+			node = devm_kzalloc(typec->dev, sizeof(*node), GFP_KERNEL);
+			if (!node) {
+				ret = -ENOMEM;
+				goto err_cleanup;
+			}
+
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
 			else
 				amode = typec_plug_register_altmode(port->plug, &desc);
 
 			if (IS_ERR(amode)) {
+				devm_kfree(typec->dev, node);
 				ret = PTR_ERR(amode);
 				goto err_cleanup;
 			}
 
-			/* If no memory is available we should unregister and exit. */
-			node = devm_kzalloc(typec->dev, sizeof(*node), GFP_KERNEL);
-			if (!node) {
-				ret = -ENOMEM;
-				typec_unregister_altmode(amode);
-				goto err_cleanup;
-			}
-
 			node->amode = amode;
 
 			if (is_partner)
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b532d3bae1de322a1cfb1205e0190f..4b255cabac60a406ea359788604a6bf21d87e08d 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -37,6 +37,52 @@ struct cros_typec_dp_data {
 	bool pending_status_update;
 };
 
+void cros_typec_altmode_cancel(struct typec_altmode *alt)
+{
+	struct cros_typec_altmode_data *adata;
+
+	if (!alt)
+		return;
+
+	adata = typec_altmode_get_drvdata(alt);
+	if (adata)
+		cancel_work_sync(&adata->work);
+}
+
+void cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled)
+{
+	struct cros_typec_altmode_data *adata;
+	struct cros_typec_dp_data *dp_data;
+	int i;
+
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		if (!port->port_altmode[i])
+			continue;
+
+		adata = typec_altmode_get_drvdata(port->port_altmode[i]);
+		if (!adata)
+			continue;
+
+		if (!enabled) {
+			disable_work_sync(&adata->work);
+			continue;
+		}
+
+		mutex_lock(&adata->lock);
+		adata->header = 0;
+		adata->vdo_data = NULL;
+		adata->vdo_size = 0;
+		if (adata->sid == USB_TYPEC_DP_SID) {
+			dp_data = container_of(adata, struct cros_typec_dp_data, adata);
+			dp_data->configured = false;
+			dp_data->pending_status_update = false;
+		}
+		mutex_unlock(&adata->lock);
+
+		enable_work(&adata->work);
+	}
+}
+
 static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065af709643ad653df487a9987780da4..bcfd8fed2073dad1e95bfba807e1af7a4dbe91e2 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -11,6 +11,15 @@ struct typec_altmode;
 struct typec_altmode_desc;
 struct typec_displayport_data;
 
+#if IS_ENABLED(CONFIG_CROS_EC_TYPEC_ALTMODES)
+void cros_typec_altmode_cancel(struct typec_altmode *alt);
+void cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled);
+#else
+static inline void cros_typec_altmode_cancel(struct typec_altmode *alt) {}
+static inline void
+cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled) {}
+#endif
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 cros_typec_register_displayport(struct cros_typec_port *port,
-- 
2.53.0
