Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0A15357B
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167527; cv=none; b=hNd5f2Mp3CtIB/hEW4g8UDvF2qlEHKDDpe+ZFd9vQL7+fpLG4CJA+qduep3rhbp0ZUnT/TIGrPPk52Zh4ZB7yeRl7vCmhWcI2HmKyRzlb4wVxvXTAJOpbAF60fmKS2bSGaxU6L+cSNzT8FmNNNyIB+8HcyVrP9hkn7YmDEuls+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167527; c=relaxed/simple;
	bh=qqGF9xLxJC4LQcm92S4IX/hRHYqAmBrg8Pca6o1qles=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ty5gak8hJb/N6s91Ht2h5ruvE3TO1VfyZb4bFzUt5up2litPIUmVK1jOgKZq6RyeHJgEX0MdyNy+0gSuTJiwNaB+DLSDmxfFpKV5wSlSmXhmNQrIk6uHvFbvC/OFWPOUXM5vZsgD94gwCZg092FSQhraObNccl0pH3oVP6VD8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EuIJlxzH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EuIJlxzH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e782e955adso60111b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712167525; x=1712772325; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=EuIJlxzHZ42xkG4pXRAkrA8GzL4ERTWXsZ9BC3B4rJgJS7RyAQl3u1bl7H0OrYo4JS
         Qnpy7atMwMl0BwcWzMqZtAG/C4hoVCWMa22Fqt28bbH+iwCbnipSTuAvA6u9koY/HoSp
         WTmtuCNYDMy4dUthSyzQFpZkV9trYdHJtaGJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167525; x=1712772325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=W+BJht4CCzbkMRCmcoAyYQs0L+zIsbt9OG++pm5tZQwie6EqJWPJa7o+2llPdU/2qI
         71WpB5fpENY9myHTWTUtmCs1GkzD+awBCrffac1GEj2RQKLJH17wyg1q+4HILBH5ViLC
         Fe08K50cxp/cWYPa0Oj7YeoaHe06gUATrr8Un3bX/VTuSiYgQkqVDfSiDErTyNBiPvJv
         ymXFrUZSt/8VnJHFnLxJJ7/15E+Mhtghvtx/HDutPYTJm5MLKRhBn8VfeiVClXq0Xlz6
         nSIPovxaWCC9mc4HjmnXVj7bwjb4HqKbhcxtQMUK3KIOJbiSAu8VaY8TwX0HQnAwiycy
         fVMg==
X-Forwarded-Encrypted: i=1; AJvYcCVA9BYqZo12L44+vFm4lku7qV3OVV5gsOBUrRbOK7mPtaeaEhw1ZhoXH5mOrhoCqCxTojV2OQvNR+KfMba+P8W4Obr/GAbTja4ZToNFEbix
X-Gm-Message-State: AOJu0YxB2ARUuVagloNtjNm/0je19BrK0HK1f5E+2Nzkh2F3n2LLXltf
	qf25ojwMZ4kiQuaPV5P+PpqSdv+tFtSYw5WWHTbSjkKACSzWtAQ1AUuxcyjA92HUVxYfGTA6TEQ
	=
X-Google-Smtp-Source: AGHT+IFofluak2TNyaj7l3kg/C527840RBEHus7enJda2FbDDZHU7/jIXCY5rcY2cES7AC48lbdI3A==
X-Received: by 2002:a05:6a00:3912:b0:6ea:74d4:a01c with SMTP id fh18-20020a056a00391200b006ea74d4a01cmr310246pfb.14.1712167524934;
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm12359162pfq.170.2024.04.03.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 03 Apr 2024 18:05:21 +0000
Subject: [PATCH v3 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-public-ucsi-h-v3-1-f848e18c8ed2@chromium.org>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
In-Reply-To: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ecc47d5fe239..c0f6d054a566 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4933,6 +4933,8 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
 struct ec_response_host_event_status {
 	uint32_t status;      /* PD MCU host event status */
 } __ec_align4;
@@ -5994,6 +5996,24 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * Read/write interface for UCSI OPM <-> PPM communication.
+ */
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	uint16_t offset;
+	uint8_t data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+struct ec_params_ucsi_ppm_get {
+	uint16_t offset;
+	uint8_t size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 

-- 
2.44.0.478.gd926399ef9-goog

