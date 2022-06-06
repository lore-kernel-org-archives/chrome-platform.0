Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF87E
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 20:19:18 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gd1so13740566pjb.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKgchf40btIWK1MuQdpSZKSX/1eMrpvBCXeKfQlCM0c=;
        b=WIF/p78dmBucCD0VYMMYwKH70nOq+zaDIaCJ9LAtoPv7eyKdRy1BUM3j0la302RRwq
         6wyWClM9UTgpMIw6Mz8dmt2D8JkhWGjZ8G6JqvaDw+gE1uU3RgCZ8J4CGoNsgiAoA1Y9
         Vfm59OXc8URyJKD85J5Y7oGWiuO+4rvvGKpSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKgchf40btIWK1MuQdpSZKSX/1eMrpvBCXeKfQlCM0c=;
        b=16+h66RaS38b/dls8ji0cIP56lyTtiWE7pfI4gla2r5ZEkaGbe0Hlsajztx86eU3or
         qVKXRkvRf2w4w7lgdDP7krB5SXzLlPsc+Rn+tOho6tKeJP/ip+55XcxcZPbtpkSO2Z/K
         TrLo527mAJqTTlVlR/4c+1t5ft68m67Iu5zl6berpuVC872khjFwOBKsPUs89JzrnxYt
         4UHG5zZSNCGHDLA4zJWaAiJOYHRy6cSUPudivgLae+eksDFFenBhmhGUDe7Orc+TcZZx
         fbrX3pTgpDIORaiGiD+yW9TpVPh418nhwEHeFCzegJDTPVblcEEJcaWHhwaosTv7UpUD
         TmCQ==
X-Gm-Message-State: AOAM531CZ3ZuljDhMpfScA6w7Glecp9ci/XHqgGCjkkAl3g/VqNeIsHd
	CLWPhoCKDJ1bhtLLJBgt8m0YCw==
X-Google-Smtp-Source: ABdhPJxkHiVN6DgKpmKwdRRTwjOWWrpuGHZS40T6pGHkSBA3jBQUl/2ZcAn9I2rENu2BRz+Bn+qKbQ==
X-Received: by 2002:a17:902:f60e:b0:158:5c4d:d9b0 with SMTP id n14-20020a170902f60e00b001585c4dd9b0mr26200738plg.63.1654546758051;
        Mon, 06 Jun 2022 13:19:18 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0015ef27092aasm10883034plk.190.2022.06.06.13.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:19:17 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: bleung@chromium.org,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROME HARDWARE PLATFORM SUPPORT),
	Daisuke Nojiri <dnojiri@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH 1/3] regulator: cros-ec: Use common cros_ec_command()
Date: Mon,  6 Jun 2022 20:18:01 +0000
Message-Id: <20220606201825.763788-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606201825.763788-1-pmalani@chromium.org>
References: <20220606201825.763788-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce code duplication by using the common cros_ec_command() function
instead of the locally defined variant.

Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/regulator/cros-ec-regulator.c | 54 ++++++---------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index c4754f3cf233..1c5fc74a4776 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -22,36 +22,6 @@ struct cros_ec_regulator_data {
 	u16 num_voltages;
 };
 
-static int cros_ec_cmd(struct cros_ec_device *ec, u32 version, u32 command,
-		       void *outdata, u32 outsize, void *indata, u32 insize)
-{
-	struct cros_ec_command *msg;
-	int ret;
-
-	msg = kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	msg->version = version;
-	msg->command = command;
-	msg->outsize = outsize;
-	msg->insize = insize;
-
-	if (outdata && outsize > 0)
-		memcpy(msg->data, outdata, outsize);
-
-	ret = cros_ec_cmd_xfer_status(ec, msg);
-	if (ret < 0)
-		goto cleanup;
-
-	if (insize)
-		memcpy(indata, msg->data, insize);
-
-cleanup:
-	kfree(msg);
-	return ret;
-}
-
 static int cros_ec_regulator_enable(struct regulator_dev *dev)
 {
 	struct cros_ec_regulator_data *data = rdev_get_drvdata(dev);
@@ -60,8 +30,8 @@ static int cros_ec_regulator_enable(struct regulator_dev *dev)
 		.enable = 1,
 	};
 
-	return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
-			  sizeof(cmd), NULL, 0);
+	return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
+			       sizeof(cmd), NULL, 0);
 }
 
 static int cros_ec_regulator_disable(struct regulator_dev *dev)
@@ -72,8 +42,8 @@ static int cros_ec_regulator_disable(struct regulator_dev *dev)
 		.enable = 0,
 	};
 
-	return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
-			  sizeof(cmd), NULL, 0);
+	return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
+			       sizeof(cmd), NULL, 0);
 }
 
 static int cros_ec_regulator_is_enabled(struct regulator_dev *dev)
@@ -85,8 +55,8 @@ static int cros_ec_regulator_is_enabled(struct regulator_dev *dev)
 	struct ec_response_regulator_is_enabled resp;
 	int ret;
 
-	ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_IS_ENABLED, &cmd,
-			  sizeof(cmd), &resp, sizeof(resp));
+	ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_IS_ENABLED, &cmd,
+			      sizeof(cmd), &resp, sizeof(resp));
 	if (ret < 0)
 		return ret;
 	return resp.enabled;
@@ -112,8 +82,8 @@ static int cros_ec_regulator_get_voltage(struct regulator_dev *dev)
 	struct ec_response_regulator_get_voltage resp;
 	int ret;
 
-	ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_GET_VOLTAGE, &cmd,
-			  sizeof(cmd), &resp, sizeof(resp));
+	ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_GET_VOLTAGE, &cmd,
+			      sizeof(cmd), &resp, sizeof(resp));
 	if (ret < 0)
 		return ret;
 	return resp.voltage_mv * 1000;
@@ -138,8 +108,8 @@ static int cros_ec_regulator_set_voltage(struct regulator_dev *dev, int min_uV,
 	if (min_mV > max_mV)
 		return -EINVAL;
 
-	return cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_SET_VOLTAGE, &cmd,
-			   sizeof(cmd), NULL, 0);
+	return cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_SET_VOLTAGE, &cmd,
+			       sizeof(cmd), NULL, 0);
 }
 
 static const struct regulator_ops cros_ec_regulator_voltage_ops = {
@@ -160,8 +130,8 @@ static int cros_ec_regulator_init_info(struct device *dev,
 	struct ec_response_regulator_get_info resp;
 	int ret;
 
-	ret = cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_GET_INFO, &cmd,
-			   sizeof(cmd), &resp, sizeof(resp));
+	ret = cros_ec_command(data->ec_dev, 0, EC_CMD_REGULATOR_GET_INFO, &cmd,
+			      sizeof(cmd), &resp, sizeof(resp));
 	if (ret < 0)
 		return ret;
 
-- 
2.36.1.255.ge46751e96f-goog

