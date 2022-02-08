Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31532C9C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 18:47:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id t14-20020a17090a3e4e00b001b8f6032d96so2598149pjm.2
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 10:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jLio1a1l75mHbmNEuBlAUNzao55kTSeKszQYcAQRX+I=;
        b=MsjVta7IYbQNKqHe58RtLXBHcrrrukRhSUHG22zWAasQ99i8xGDjf6fjdG686TlnIa
         nybAKSUI943yDMYt1V4L4HPXRb7QQjwNcAdgkBEA7mkKq7rvOzgkYGUwhNrja80IyCzj
         TubUKDuwMDz9gZ1PzfVVVhqUkOhBd0PGbly6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jLio1a1l75mHbmNEuBlAUNzao55kTSeKszQYcAQRX+I=;
        b=lQvn4XCAIhpBkJ8956uXs/9OLW5S51RfOzr5bSddn24gGs8HTQfcw/uvf+ILuHxz2b
         +al3huFj8JsQL+05oxQXgHqnSZc3d2C/DsVwgYelMG2mk/8bx86RtxuxEDnYpbLjgJrD
         +Kv3L8JByoqkdf9Czfn0eRuCzpR2MS4eMDnSHgj3dMOlekhmDDfWSWu4j4ek0agpy13/
         NEzS0AerCdqBifugoJWres2J3UKUmf7MnF+qL+4tz+TK+Kkcxis2p8vMuK3DbPBrI9vO
         77Gz7z/lbxXpYZ+A3WWt/Q8C+CITFyt75uMOP97IPe9+rdykoWS3x8XKlkK2VEt0cudK
         20YQ==
X-Gm-Message-State: AOAM5320b1NE2J1qprpcrCInAsvdng9A3J46yCpT977SWplrachq/kWG
	0OU4Xqh0adCDkbwEzuhDf6Gf2g==
X-Google-Smtp-Source: ABdhPJzA8ECq/26nKv0NhBy5xwK2bu7d8aQaB1wRho9op9ZuMhWeJ0H4ktflQM6NMxY0ajIdDbI8/g==
X-Received: by 2002:a17:902:da88:: with SMTP id j8mr5904035plx.105.1644346078477;
        Tue, 08 Feb 2022 10:47:58 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id gk15sm3594453pjb.3.2022.02.08.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 10:47:58 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER)
Subject: [PATCH v2 3/4] platform/chrome: cros_ec_typec: Configure muxes at start of port update
Date: Tue,  8 Feb 2022 18:47:22 +0000
Message-Id: <20220208184721.1697194-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208184721.1697194-1-pmalani@chromium.org>
References: <20220208184721.1697194-1-pmalani@chromium.org>
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

Changes in v2:
- Change return at end of port_update() to just return 0.

 drivers/platform/chrome/cros_ec_typec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3d34ece7f790..3019e29f200d 100644
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
@@ -980,12 +985,7 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 	if (typec->typec_cmd_supported)
 		cros_typec_handle_status(typec, port_num);
 
-	/* Update the switches if they exist, according to requested state */
-	ret = cros_typec_configure_mux(typec, port_num, &resp);
-	if (ret)
-		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
-- 
2.35.0.263.gb82422642f-goog

