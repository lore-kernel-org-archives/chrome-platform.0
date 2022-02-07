Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851C2F25
	for <chrome-platform@lists.linux.dev>; Mon,  7 Feb 2022 21:40:53 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id v4so8327792pjh.2
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 13:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLTcgJEE5JgO7+vcfSsf1eN9sSCfARQf+RGdDGP6rwo=;
        b=SfFjpz5qq97wVAMpmv9jw6U2UOOU8z/fn7keqOWSGZgJ2JSWWhYtWvaONjLt8rsuRg
         /AXYYnec7GIsl94j84iAZ5Fe6LRIUMEKxsphuve2FJBuPmTySoltfHVbDSS+j+VUkVLR
         Ojg0G3Bbr3QZO5wn58fxf1CPXN0ZgS5Yu4J7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLTcgJEE5JgO7+vcfSsf1eN9sSCfARQf+RGdDGP6rwo=;
        b=h2lGkDoMP8QktUx6SIevGPSW/okbg1W21Q0s10GYAyOXnJjMEww0XqvRA/SBr5XoxQ
         sTVylD7ceqCtLTFe+rcMjcRRZhHwj+bFInQ4h0P7ZrPL6jxGUYT34nSFmKsJB6bIJGyT
         gWtU5OyYC9jfDDqr9BznLx5PA79CofVmNvOcKuHGK0RTd44P6rCmJReAJdG6v+lsxNK6
         oxHRA6ES3hyft75gyg10WL1WbH7ivKKsUtgWGSBFIm0WR46tLbLAy7XFyCZLszkOisqe
         SD7BS7AxS/tRoPdmksBAUd2nwvDa9og/t5JCcIAx32DzfYXID1WHCHApyHtifi5xlMtV
         i2YA==
X-Gm-Message-State: AOAM5317M0dCKkRmMMmWDMex4VAqspxTVCdUHN9tQoT1afZAGS4O6oNF
	5FcbBh9MCA+HbZT6VJj5Qck3NA==
X-Google-Smtp-Source: ABdhPJz8XeVRKNiZrIITbxZKovi5CB3bJAlwxEaK1wwdUZeiNzvobdhk5htJLyoVfrL6v/Hp/eILsA==
X-Received: by 2002:a17:90a:738d:: with SMTP id j13mr992638pjg.196.1644270052694;
        Mon, 07 Feb 2022 13:40:52 -0800 (PST)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s9sm9268010pgm.76.2022.02.07.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:40:52 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROMEOS EC USB TYPE-C DRIVER),
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 1/4] platform/chrome: cros_ec_typec: Move mux flag checks
Date: Mon,  7 Feb 2022 21:40:24 +0000
Message-Id: <20220207214026.1526151-2-pmalani@chromium.org>
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

Move mux and role flag checks inside of cros_typec_configure_mux(),
which is a more logical location for them.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c6f17e3ef72d..445da4f122e7 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -519,7 +519,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	struct cros_typec_port *port = typec->ports[port_num];
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
-	int ret;
+	int ret = 0;
+
+	/* No change needs to be made, let's exit early. */
+	if (port->mux_flags == mux_flags && port->role == pd_ctrl->role)
+		return 0;
+
+	port->mux_flags = mux_flags;
+	port->role = pd_ctrl->role;
 
 	if (mux_flags == USB_PD_MUX_NONE) {
 		ret = cros_typec_usb_disconnect_state(port);
@@ -983,13 +990,6 @@ static int cros_typec_port_update(struct cros_typec_data *typec, int port_num)
 		return 0;
 	}
 
-	/* No change needs to be made, let's exit early. */
-	if (typec->ports[port_num]->mux_flags == mux_resp.flags &&
-	    typec->ports[port_num]->role == resp.role)
-		return 0;
-
-	typec->ports[port_num]->mux_flags = mux_resp.flags;
-	typec->ports[port_num]->role = resp.role;
 	ret = cros_typec_configure_mux(typec, port_num, mux_resp.flags, &resp);
 	if (ret)
 		dev_warn(typec->dev, "Configure muxes failed, err = %d\n", ret);
-- 
2.35.0.263.gb82422642f-goog

