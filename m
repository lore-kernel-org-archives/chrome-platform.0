Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86B7E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:52:28 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68bed28cb22so394278b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931948; x=1693536748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3+URBqZpZF2x77jWPMvlepFC5eyrNLor5lT2YRYaCA=;
        b=jwSGOFVLVU0xCoY5pLfoOIfVqNP8RbKX7XksFTPUAFAqV6iwheXJgNjC8ZtGGe6m1x
         CotQ0N88c1rbuo3NZtpi8JoLZhjBMz8TjxRUUiYVCMASj9wYBBpvCU/Yhl9LNYZRpeqt
         sNA4eLMBgnzgSrLHMhAFDs6rXjqpsxbWgdoVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931948; x=1693536748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3+URBqZpZF2x77jWPMvlepFC5eyrNLor5lT2YRYaCA=;
        b=VfKa2K7KdkqrQNt5QxSvq5FrFC47OB65uEdzE4czLR41BmVm2qoyGI4DMcHtnynuJ3
         81aqCdv6Y9BtF9xv81K5laFUHDaLqgQpsogksHxP/vIz1dsn2vAM+ZOIGbcHI8SoSYnD
         IhEeWcPCKdDS8XCm+4LWKMNF2KtEfl6Q8/VWmFIjblkmubwVf2hyHfPKaO7thCsTBp81
         qk+AwF7AqqtLcPCfQVjItIfGrlUuKcrYHY+KiZOWyEADFOA9f6fPdw45Wt+Zw2EU7xjk
         SJMFb8MqxtF4hdXplMm+5HB/ITudD5cCGEEwN1pW5z9xHeUuQtQc7mQc7KRYdXWKjeKR
         qEpA==
X-Gm-Message-State: AOJu0YzYwNZ3aG9A94NCJELp6Yy5KPjtui2frdw9oLNtaLquu4ttaddm
	uzDNkijVt8fZgp3tFVB31QqfZg==
X-Google-Smtp-Source: AGHT+IEC1VIJWj32bHEOO6xQnrTuBhX+AC88P89p+LUarmfmkZr7HIRKlDIkSrMR0GjJYmfbF0GsRw==
X-Received: by 2002:a05:6a20:1447:b0:148:40cf:b832 with SMTP id a7-20020a056a20144700b0014840cfb832mr18251618pzi.18.1692931948099;
        Thu, 24 Aug 2023 19:52:28 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:52:27 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 7/9] media: cros-ec-cec: Allow specifying multiple HDMI connectors
Date: Fri, 25 Aug 2023 12:44:00 +1000
Message-ID: <20230825024735.1443836-8-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
References: <20230825024735.1443836-1-rekanorman@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the cec_dmi_match_table to allow specifying multiple HDMI
connectors for each device.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

Changes in v2:
- Use NULL-terminated arrays for the conns field of cec_dmi_match

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 49 ++++++++++++-------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 6989e63c05be..371699d599de 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -284,38 +284,43 @@ static SIMPLE_DEV_PM_OPS(cros_ec_cec_pm_ops,
 #if IS_ENABLED(CONFIG_PCI) && IS_ENABLED(CONFIG_DMI)
 
 /*
- * The Firmware only handles a single CEC interface tied to a single HDMI
- * connector we specify along with the DRM device name handling the HDMI output
+ * Specify the DRM device name handling the HDMI output and the HDMI connector
+ * corresponding to each CEC port. The order of connectors must match the order
+ * in the EC (first connector is EC port 0, ...), and the number of connectors
+ * must match the number of ports in the EC (which can be queried using the
+ * EC_CMD_CEC_PORT_COUNT host command).
  */
 
 struct cec_dmi_match {
 	const char *sys_vendor;
 	const char *product_name;
 	const char *devname;
-	const char *conn;
+	const char *const *conns;
 };
 
+static const char *const fizz_conns[] = { "Port B", NULL };
+
 static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Fizz */
-	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
+	{ "Google", "Fizz", "0000:00:02.0", fizz_conns },
 	/* Google Brask */
-	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	{ "Google", "Brask", "0000:00:02.0", fizz_conns },
 	/* Google Moli */
-	{ "Google", "Moli", "0000:00:02.0", "Port B" },
+	{ "Google", "Moli", "0000:00:02.0", fizz_conns },
 	/* Google Kinox */
-	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
+	{ "Google", "Kinox", "0000:00:02.0", fizz_conns },
 	/* Google Kuldax */
-	{ "Google", "Kuldax", "0000:00:02.0", "Port B" },
+	{ "Google", "Kuldax", "0000:00:02.0", fizz_conns },
 	/* Google Aurash */
-	{ "Google", "Aurash", "0000:00:02.0", "Port B" },
+	{ "Google", "Aurash", "0000:00:02.0", fizz_conns },
 	/* Google Gladios */
-	{ "Google", "Gladios", "0000:00:02.0", "Port B" },
+	{ "Google", "Gladios", "0000:00:02.0", fizz_conns },
 	/* Google Lisbon */
-	{ "Google", "Lisbon", "0000:00:02.0", "Port B" },
+	{ "Google", "Lisbon", "0000:00:02.0", fizz_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-						const char **conn)
+						const char * const **conns)
 {
 	int i;
 
@@ -332,7 +337,7 @@ static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
 			if (!d)
 				return ERR_PTR(-EPROBE_DEFER);
 			put_device(d);
-			*conn = m->conn;
+			*conns = m->conns;
 			return d;
 		}
 	}
@@ -346,7 +351,7 @@ static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
 #else
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-						const char **conn)
+						const char * const **conns)
 {
 	return ERR_PTR(-ENODEV);
 }
@@ -388,7 +393,7 @@ static int cros_ec_cec_get_write_cmd_version(struct cros_ec_cec *cros_ec_cec)
 static int cros_ec_cec_init_port(struct device *dev,
 				 struct cros_ec_cec *cros_ec_cec,
 				 int port_num, struct device *hdmi_dev,
-				 const char *conn)
+				 const char * const *conns)
 {
 	struct cros_ec_cec_port *port;
 	int ret;
@@ -406,7 +411,13 @@ static int cros_ec_cec_init_port(struct device *dev,
 	if (IS_ERR(port->adap))
 		return PTR_ERR(port->adap);
 
-	port->notify = cec_notifier_cec_adap_register(hdmi_dev, conn,
+	if (!conns[port_num]) {
+		dev_err(dev, "no conn for port %d\n", port_num);
+		ret = -ENODEV;
+		goto out_probe_adapter;
+	}
+
+	port->notify = cec_notifier_cec_adap_register(hdmi_dev, conns[port_num],
 						      port->adap);
 	if (!port->notify) {
 		ret = -ENOMEM;
@@ -435,10 +446,10 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	struct cros_ec_cec *cros_ec_cec;
 	struct cros_ec_cec_port *port;
 	struct device *hdmi_dev;
-	const char *conn = NULL;
+	const char * const *conns = NULL;
 	int ret;
 
-	hdmi_dev = cros_ec_cec_find_hdmi_dev(&pdev->dev, &conn);
+	hdmi_dev = cros_ec_cec_find_hdmi_dev(&pdev->dev, &conns);
 	if (IS_ERR(hdmi_dev))
 		return PTR_ERR(hdmi_dev);
 
@@ -460,7 +471,7 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 
 	for (int i = 0; i < cros_ec_cec->num_ports; i++) {
 		ret = cros_ec_cec_init_port(&pdev->dev, cros_ec_cec, i,
-					    hdmi_dev, conn);
+					    hdmi_dev, conns);
 		if (ret)
 			goto unregister_ports;
 	}
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

