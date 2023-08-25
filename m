Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE047E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:53:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c06f6f98c0so4584855ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931994; x=1693536794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dugPNPrpRp20Yd0O9nctENrWeeR3ORCR/xP4x4RAic=;
        b=kUsFiECEZpTrPQFc8F/uDF4rHYH4vybiNaFnPghtvyBKKmZ9Bje+SEjmmjEerhmzCl
         CYVBghYEA1/TUoIx5EEUOkcuwx53A+/kBvFdIoh711qp6sbLW0dgQqSjk9DiamKGlit+
         6vj+hK0sMuyscmmRkQ01q9gFDoU77NtaBIcYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931994; x=1693536794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dugPNPrpRp20Yd0O9nctENrWeeR3ORCR/xP4x4RAic=;
        b=FErnJcJBq0uuwhEFxjdJjv6dSCflZzMjSBd+wxPRld2rJ2373Teqov6Ua5Zz7T4XKw
         8hE2NZhbf1vtbZKVN+cLPAoSZLX+4vKVPPlB/mmkPprAdv4t1v46nbko1/9vw36/msT2
         msFZIEXzhY+eDe2NSfT99JH9FNKRORfB0+9NVVUsU/codtn52xvaYJN/D8noUOjV/x8+
         GopOoPmr1pzZrfaCeHKu8/GFnzMuIN6R6HFLZH+RnG7ar3mNnNupp4y9b23mSWbk9jLn
         3URGuZL4LO6CJ7OZa5g8+SrTKyDq1+hvrdoWaSnZkM+R3ePPJ9NmVNF39WMCpig3XUOq
         OeMQ==
X-Gm-Message-State: AOJu0YxDwB4+IJAyiTf2DF4vZtopHW5MCqVn2cuPZeCXZInXTSobE6aG
	vLEv2jLdoCpUMEIW9cBKZwXV6w==
X-Google-Smtp-Source: AGHT+IEkc7Xs+45n58w3dsFPGkMtOXljc3EaX3VUWt/vtWRbIjVktIboj9yBRphEmhsRVco1KvBeAg==
X-Received: by 2002:a17:903:187:b0:1bd:b7ad:a584 with SMTP id z7-20020a170903018700b001bdb7ada584mr22007289plg.44.1692931994207;
        Thu, 24 Aug 2023 19:53:14 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:53:13 -0700 (PDT)
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
Subject: [PATCH v2 8/9] media: cros-ec-cec: Get number of CEC ports from EC
Date: Fri, 25 Aug 2023 12:44:01 +1000
Message-ID: <20230825024735.1443836-9-rekanorman@chromium.org>
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

Add a new CEC port count host command and use it to query the number of
CEC ports from the EC. If the host command is not supported then it must
be old EC firmware which only supports one port, so fall back to
assuming one port.

This patch completes support for multiple ports in cros-ec-cec.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

(no changes since v1)

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 40 ++++++++++++++++---
 .../linux/platform_data/cros_ec_commands.h    | 11 +++++
 2 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 371699d599de..993deb85d3e2 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -21,10 +21,6 @@
 
 #define DRV_NAME	"cros-ec-cec"
 
-/* Only one port is supported for now */
-#define CEC_NUM_PORTS	1
-#define CEC_PORT	0
-
 /**
  * struct cros_ec_cec_port - Driver data for a single EC CEC port
  *
@@ -358,6 +354,38 @@ static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
 
 #endif
 
+static int cros_ec_cec_get_num_ports(struct cros_ec_cec *cros_ec_cec)
+{
+	struct ec_response_cec_port_count response;
+	int ret;
+
+	ret = cros_ec_cmd(cros_ec_cec->cros_ec, 0, EC_CMD_CEC_PORT_COUNT, NULL,
+			  0, &response, sizeof(response));
+	if (ret < 0) {
+		/*
+		 * Old EC firmware only supports one port and does not support
+		 * the port count command, so fall back to assuming one port.
+		 */
+		cros_ec_cec->num_ports = 1;
+		return 0;
+	}
+
+	if (response.port_count == 0) {
+		dev_err(cros_ec_cec->cros_ec->dev,
+			"EC reports 0 CEC ports\n");
+		return -ENODEV;
+	}
+
+	if (response.port_count > EC_CEC_MAX_PORTS) {
+		dev_err(cros_ec_cec->cros_ec->dev,
+			"EC reports too many ports: %d\n", response.port_count);
+		return -EINVAL;
+	}
+
+	cros_ec_cec->num_ports = response.port_count;
+	return 0;
+}
+
 static int cros_ec_cec_get_write_cmd_version(struct cros_ec_cec *cros_ec_cec)
 {
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
@@ -463,7 +491,9 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	cros_ec_cec->num_ports = CEC_NUM_PORTS;
+	ret = cros_ec_cec_get_num_ports(cros_ec_cec);
+	if (ret)
+		return ret;
 
 	ret = cros_ec_cec_get_write_cmd_version(cros_ec_cec);
 	if (ret)
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ad61c7ff0b28..7dae17b62a4d 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4536,6 +4536,17 @@ struct ec_response_cec_get {
 	uint8_t val;
 } __ec_align1;
 
+/* Get the number of CEC ports */
+#define EC_CMD_CEC_PORT_COUNT 0x00C1
+
+/**
+ * struct ec_response_cec_port_count - CEC port count response
+ * @port_count: number of CEC ports
+ */
+struct ec_response_cec_port_count {
+	uint8_t port_count;
+} __ec_align1;
+
 /* CEC parameters command */
 enum cec_command {
 	/* CEC reading, writing and events enable */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

