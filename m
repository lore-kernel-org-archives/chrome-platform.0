Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48339FCAE
	for <chrome-platform@lists.linux.dev>; Mon,  8 Jun 2026 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953329; cv=none; b=eIVHep/NxpkuciDmzRjEFWBJZuUooc8ISMKAcfpI5HhbACIyubf2mysxmjwZCh44s6pyilqwaX0qt74McXKmNLzHwyNwbuyFePFXjEzj3oL+Zpm1t8bOj2LLGnxJb8DI06US8543lcK2TkKpuEjW4BC/F/NqYaNkJItGcS+NQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953329; c=relaxed/simple;
	bh=zKNy8hGUS3LWsGWV7uDTSeyB13YVSSRaScQc+RLVrkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peJLaRexl6/kQeO9OT3oBhlzdIIsGDySwbjST6JgHrGNH3GubeOxz/szxcGwqJON+H1ku6AGDTKZqGdrMxpiHlFL50ZdvzN+OijdLw6NZQGlXg5yXn5n6ZriAPkNL1+LxDnLZ/rA+dv8LTZGNwshWDAsLYSBPfF7hoihbalh2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jF7p+xMs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jF7p+xMs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bed4f2f0898so605597866b.3
        for <chrome-platform@lists.linux.dev>; Mon, 08 Jun 2026 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780953327; x=1781558127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2XtLRNCiy5wHmXG3gKDJJKhOpnBl1oOdXrnfVdZyts=;
        b=jF7p+xMshsendAo3h78JmXh6nuGXHLITzpyDjMbmaekV1vrcWEkWADaO2Z1gUnvqfG
         OcUQcPPyZ41rYZ50M60mvNoZwckhF6cKjdRFU1jG283KWUKZBLaZcYtS3QkjsDl3jArQ
         lvUMAPcYv8NkOyjqPZ84zDglB9ZpYMLnK1ORE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953327; x=1781558127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2XtLRNCiy5wHmXG3gKDJJKhOpnBl1oOdXrnfVdZyts=;
        b=rJIDZ8WNHN2GYWImhrIQC+Djh5HqedPhjKuswQEDjuRfqC9CNWFR1A30OxNn3pZajo
         tCocnH+XRoPGO9gPNZqI94y466GxEqvCXc5z6yLzB+aA7e3rpxc0TooG3OM4fiGlJFRj
         qdA/hS6JKT2d0+Fqu5llx6iLNXitzOJM5oUVO7uZMevtXep15ktU8qIYgqQwhfqd/Pva
         wBDOzQgRDwJGc8CxvlTT0gi2wWRNhzfm2/7EVy1mO9D1cqpMbPGvrwYTbFTa5r5Uu+ki
         ldvezYfFVIVTsrg40krIcVBSLymuRLgEgs1ujUUKPKeOrMAS1CN3QPcotUrQKGUWy4AD
         mSTw==
X-Forwarded-Encrypted: i=1; AFNElJ9foHKX/d+BWibgbmReAcOhnbu/3pmInQU0HECi2Ra0sOr11I4uRcQEWYBMav4jv/zFBYrS7oCu2z6wHL5g3qw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNoWe6Ni338Lo1zl/q3GPjTlPhs2KmysIgFm6YM/dqIl19IZSM
	+Ye7i1xnhDnndqDW25cfuFCETGeUXWFBtw7K9IN6WNTUz+M93kJQXCrqZrv1MZtxug==
X-Gm-Gg: Acq92OEP5N/K9nH+gj5u5ZsyWKybxeQA36OBazUwPLL4dlB9nKPY53U5utIgvuISQlN
	T5qKO1Wv0vFStTpGYYLgeOkheZnAyRbvUiGnkPKecnZyU5TOjbAgk+Yzvmq65ODNQUrglY1Ns9e
	BDwAtvPYUrqbmX7wyLr8Bcz+sq/B7VC0z73NtnS9IW4HoDJe+GlD3ygTpUxS7PmUYCAg7hbI4Ge
	o+Mub9miG45WBuyYv1taCLulZtBr/YOsr1hOCf8384TID/5fMKvqxHmrg4hvqscspwkJoYRNQIK
	H+X4UB+plwpYbFeMfGAs0zcj5jecyThco8rdAP/UCyZEM38i1ROm9qHKJVfPs7oDQ+AtRAfFTfa
	OGhjunHSDe3ZmYmrwzazJQLouCneB/EIR8aVue/x54l3+lxSNRsS+lUCttg5j4Fc0iK3HETD6Pr
	2GSdVHySRRDVImOKTJSMl0Yvvn1Cj4PICunBWvjbtb6Wzbn+DxL4oWkqnSjDhXu7AZrPKM2ld0n
	gLoCOCniwLZBY0VcTiF4seecbcWaFk=
X-Received: by 2002:a17:907:74a:b0:beb:4674:6a1d with SMTP id a640c23a62f3a-bf370477cc3mr839313666b.11.1780953326934;
        Mon, 08 Jun 2026 14:15:26 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm931041566b.4.2026.06.08.14.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:15:26 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper
Date: Mon,  8 Jun 2026 21:15:17 +0000
Message-ID: <20260608211518.2214740-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
In-Reply-To: <20260608211518.2214740-1-akuchynski@chromium.org>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the EC feature-reading logic from cros_ec_check_features() into
cros_ec_read_features() helper function.

Currently, cros_ec_check_features() swallows command transfer errors. By
isolating the transaction logic into an explicit helper that returns the
actual transfer error code, subsequent callers (such as the cros_ec_dev
driver during device probing) can catch a read error.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c     | 30 +++++++++++++++------
 include/linux/platform_data/cros_ec_proto.h |  2 ++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 1d8d9168ec1aa..724d1313f6b21 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -946,6 +946,27 @@ u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev)
 }
 EXPORT_SYMBOL(cros_ec_get_host_event);
 
+/**
+ * cros_ec_read_features() - Read EC features
+ *
+ * @ec: EC device.
+ *
+ * Return: >= 0 on success, negative error number on failure.
+ */
+int cros_ec_read_features(struct cros_ec_dev *ec)
+{
+	int ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
+			      NULL, 0, &ec->features, sizeof(ec->features));
+
+	if (ret < 0) {
+		dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
+		memset(&ec->features, 0, sizeof(ec->features));
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cros_ec_read_features);
+
 /**
  * cros_ec_check_features() - Test for the presence of EC features
  *
@@ -960,17 +981,10 @@ EXPORT_SYMBOL(cros_ec_get_host_event);
 bool cros_ec_check_features(struct cros_ec_dev *ec, int feature)
 {
 	struct ec_response_get_features *features = &ec->features;
-	int ret;
 
 	if (features->flags[0] == -1U && features->flags[1] == -1U) {
 		/* features bitmap not read yet */
-		ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
-				  NULL, 0, features, sizeof(*features));
-		if (ret < 0) {
-			dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
-			memset(features, 0, sizeof(*features));
-		}
-
+		cros_ec_read_features(ec);
 		dev_dbg(ec->dev, "EC features %08x %08x\n",
 			features->flags[0], features->flags[1]);
 	}
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 6ed1c4c5ce2ef..a1ccecf5e1f83 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -271,6 +271,8 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 
 u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev);
 
+int cros_ec_read_features(struct cros_ec_dev *ec);
+
 bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
 
 int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
-- 
2.54.0.1032.g2f8565e1d1-goog

