Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32176524E
	for <chrome-platform@lists.linux.dev>; Mon,  8 May 2023 18:34:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1aaff9c93a5so33218435ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 May 2023 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683570882; x=1686162882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENrmHrZCa2KACgxhhiJXtsOjJ10wJCI2jUF2VRrMiic=;
        b=be5YN7QtcMkZ11hMLSFpfny3Z1+Vv4brKpdoEEOy+slNFww80COFQHL29pthNHIg/v
         87/GJaHpfH+QA0KMo1bjZ4rXO6U9tO3qNfsn1J4/Q8Fa5dVMA1z02yC6SnqwqucHUDzG
         5zjfPsahQfprVaQARLy1/sRWyHlOlxQAfQAhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683570882; x=1686162882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENrmHrZCa2KACgxhhiJXtsOjJ10wJCI2jUF2VRrMiic=;
        b=SBgr5Cyq7zB+W24NhewhN2zLnP9squiBVprM01dc5I9A+ToR2e6ZgdTx1OgJ8dnuMW
         ppgkdBLvAiHASRoIZdCDnk9e+eUYr7ti36EXgvu1oEicaXYoC8eqFc0/RPS3HrxPnpye
         iNER0NQdtMvJ9sAivHC5wKMQztvqZAuZqznmPrQl2xIWxKtlw2qKnSz0CLpzAIAkKnC0
         NUe2h6xiYJdZy34HxLid5tXq3qgvavmsw9290Wckg6n2b96yil48Hq6WyXTsoCdI3MTm
         necXrPuskLfDhC0fGBMj3sQjZntdTRgWha64BcmfY1HvQenz80RjJ4lfO7TEb6afgKd/
         t+WA==
X-Gm-Message-State: AC+VfDxpo3kYtiHgiSwf2vHIjvrwo8nBjc2Apa70bv9YTIMzQnYsEjNj
	CUelZuwVox22ful0UOKgdIZ7tQ==
X-Google-Smtp-Source: ACHHUZ50TZqve8vze0cKv1qkKDiZSg5fvQX7AhbVzO06obFIIehBk3Pk1OL4/s3leevqEpTFld9fIg==
X-Received: by 2002:a17:903:11c3:b0:1ab:160c:526d with SMTP id q3-20020a17090311c300b001ab160c526dmr12205554plh.22.1683570882577;
        Mon, 08 May 2023 11:34:42 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902c18700b001aadfdfcd06sm7617760pld.299.2023.05.08.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:34:42 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] platform/chrome: cros_typec_switch: Add Pin D support
Date: Mon,  8 May 2023 18:34:27 +0000
Message-ID: <20230508183428.1893357-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS EC's mux interface allows us to specify whether the port
should be configured for Pin Assignment D in DisplayPort alternate mode
(i.e 2 lanes USB + 2 lanes DP). Update the function that determines mux
state to account for Pin Assignment D and return the appropriate mux
setting.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_typec_switch.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 752720483753..0eefdcf14d63 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -51,13 +51,18 @@ static int cros_typec_cmd_mux_set(struct cros_typec_switch_data *sdata, int port
 static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *alt)
 {
 	int ret = -EOPNOTSUPP;
+	u8 pin_assign;
 
-	if (mode == TYPEC_STATE_SAFE)
+	if (mode == TYPEC_STATE_SAFE) {
 		ret = USB_PD_MUX_SAFE_MODE;
-	else if (mode == TYPEC_STATE_USB)
+	} else if (mode == TYPEC_STATE_USB) {
 		ret = USB_PD_MUX_USB_ENABLED;
-	else if (alt && alt->svid == USB_TYPEC_DP_SID)
+	} else if (alt && alt->svid == USB_TYPEC_DP_SID) {
 		ret = USB_PD_MUX_DP_ENABLED;
+		pin_assign = mode - TYPEC_STATE_MODAL;
+		if (pin_assign & DP_PIN_ASSIGN_D)
+			ret |= USB_PD_MUX_USB_ENABLED;
+	}
 
 	return ret;
 }
-- 
2.40.1.521.gf1e218fcd8-goog

