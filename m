Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF52C80
	for <chrome-platform@lists.linux.dev>; Mon,  7 Feb 2022 21:41:29 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i30so15288655pfk.8
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 13:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tcubl29wxHrfPOdKaU07z1LfBhKF2TahuS0DNugCibg=;
        b=P9mQpQf+5Bnn27EUGTnkmIZKoXhB3KlHr2N64cTo7YYurZP/mLFu40sjirHtATMxvL
         WtTAG0uGmf4tTd4F9ITtPYlxb3I7UFw9xVJdBNpOi9S/XYady/yHlNbLxIDnstkI2dvv
         EwCEFkazZwpdY9ryvKOcPAlgWeCn1S6na8rDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tcubl29wxHrfPOdKaU07z1LfBhKF2TahuS0DNugCibg=;
        b=A6fNvmWEMSxXQSKBJIG91G+UwUgABWPvqxGs4j3EXwQzu+iGymLUavahrDENSaHysM
         yhxRqXvcSv/WQK+1QWkVxM/DqDBTUozu9IslNyvxCYDC4hgtwIYGN0F3ZVGYGGqZcIfw
         30ZcgrHxqHl6mVVe9E8+b2zeEH1kMyX3jpqXv0jaNdu6kFee2ap5e3FDmK/7QwVpW0Oc
         iueMZ8oRDW4Mp8q+fHM8NjS/72IDTZkX6Ptfab4iuca2lLnu0QI4K8C0+u9wWvWBDiX+
         NBmVgPyCrrip/pC7K4kUGf+X+H1k4Hu+TktYqLzV9JrdyPIAyhm02B5gu6FhkxzD5oTy
         bk1g==
X-Gm-Message-State: AOAM533x4pIAUbmOJ2gW6cfwVvAksPX3Pmf7DqNIHlgQbnnw2N9REYEU
	ScBVMerjwQpSGiVfmmTM3ecQ7g==
X-Google-Smtp-Source: ABdhPJwW4HOSPUEVZwDeOrc4ZHIHjzjmHviUCjZFB/LBvAqozD33GakPGcuKE+nM6JHJABWvGkcfKQ==
X-Received: by 2002:a65:550a:: with SMTP id f10mr1118443pgr.204.1644270088935;
        Mon, 07 Feb 2022 13:41:28 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s9sm9268010pgm.76.2022.02.07.13.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:41:28 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER)
Subject: [PATCH 3/4] platform/chrome: cros_ec_typec: Configure muxes at start of port update
Date: Mon,  7 Feb 2022 21:40:28 +0000
Message-Id: <20220207214026.1526151-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220207214026.1526151-1-pmalani@chromium.org>
References: <20220207214026.1526151-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are situations where the mux state reported by the Embedded
Controller (EC), might lag the partner "connected" state. So, the mux
state might still suggest that a partner is connected, while the PD
"connected" state, being in Try.SNK (for example) suggests that the
partner is disconnected.

In such a scenario, we will end up sending a disconnect command to the
mux driver, followed by a connect command, since the mux is configured
later. Avoid this by configuring the mux before
registering/disconnecting a partner.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 671d3569faf6..164c82f537dd 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -965,6 +965,11 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 	if (ret < 0)
 		return ret;
 
+	/* Update the switches if they exist, according to requested state */
+	ret = cros_typec_configure_mux(typec, port_num, &resp);
+	if (ret)
+		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
+
 	dev_dbg(typec->dev, "Enabled %d: 0x%hhx\n", port_num, resp.enabled);
 	dev_dbg(typec->dev, "Role %d: 0x%hhx\n", port_num, resp.role);
 	dev_dbg(typec->dev, "Polarity %d: 0x%hhx\n", port_num, resp.polarity);
@@ -980,11 +985,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 	if (typec->typec_cmd_supported)
 		cros_typec_handle_status(typec, port_num);
 
-	/* Update the switches if they exist, according to requested state */
-	ret = cros_typec_configure_mux(typec, port_num, &resp);
-	if (ret)
-		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
-
 	return ret;
 }
 
-- 
2.35.0.263.gb82422642f-goog

