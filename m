Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D78254877
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298294; cv=none; b=qPhvDIWI5C8xUVG4jd81+VACG+NRHLdpulrWwpGuauZ4wIpEaI33xzJVHMvm+Qnwa3rN2untwGW/s8/e2vv8PMABuKHhcFgzQMK2c1BkY7ufQG6XF1kghTiaVr7RmY57ugEKcuaFR9V7vwCpJydal4zOQNBXRylH+MJGiayUbFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298294; c=relaxed/simple;
	bh=3x19bC4TEkjCbZhfuYqU5c/VjurC/2Z6kwyVqMzBqdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ29e7k7+kcdvEIdsG7OSkHkmJOy8lDfXepuDnNyLDBwdx2iLapwOMibCIDSQoGp4DGDkuuv9xTwoTyF77eAe4zopT73GWjSnpKRGffXPoyCp9a7oPJPqlAFIW/KKuBN1zHx8NDgQlwHG7XdTVzXMwn0PeFErXB4gwgW/GE4CQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OvMht9yX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OvMht9yX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so4707481a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298287; x=1754903087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnQpTwABThBxdUskT3LdV6JNdqJ4VQSfDvVtzabNNUU=;
        b=OvMht9yXtzGXwhaxPEAPIXVQaQQe3af/GZuyEQy2Ex/M32QFaOl4JjUvvpkXlQjyYp
         Wk1QvLq1/KbgKkg3jPpXHyP/YzxmZILKQJPqRc9eTFQV4cRdFsoB6gWvFVfoaZBkEr6d
         XZ61x7jSbcjuMS4ku+Wm6Qsigs5vB6EMzfTBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298287; x=1754903087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnQpTwABThBxdUskT3LdV6JNdqJ4VQSfDvVtzabNNUU=;
        b=d64PFSnpu3D7Bck2AzPHlXS5NiNUaNzQW2YIN072w9k5WN8SjyDN2si9ku65kyu7oj
         8hIIc1M4d7QOLZ1NUPEFl0gPHlsU4sUUSHFDCT4obw+ot5lO+einBbV8MWo2z4WaoWMg
         t2I4UaMzRZ547S6fEzY2O9MKlnkScJrBh29y+oaKlQybq33VGz10RGpyekwvzlfu6hVB
         Eozmu3C8nc0VjHBq85ksiIxW9zpP6lnSmpt2Acxujo7q0kt/cvWVcs6tJ3r9JlqP6Wz/
         kgKMgCjSkNToRFn9sxW2hrv6ssKOqbE2Cpuj3i9+H7YnZJoKMQKtXUlQsQVhC/QSh+xL
         Xy7g==
X-Forwarded-Encrypted: i=1; AJvYcCX498/p6tUYDwC/bs1zbq7cb6lpsesSmUoCpCUjxznqI2dQXHtURGLBKL54k2D9n6UMNGixzvWTT39UseLbAAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6GXzZZdHn8H+Jmhayi929s4KGMuFmCzmiyT3fPOiqw7W5Fiqk
	n+uHLFBGMIWLWHZri/fmRb0NzLjdrxFU0d6A7JMGNA/iJisRk+nS99gva358XvGa9w==
X-Gm-Gg: ASbGncsmboHj4mjPGBlEGmxTlNn5pQNnw8ZdQSkY/gNB9l2vBbDuGrcbxCloti8gYK+
	GVQ+fOk7P1OK+KaABkHbLl4Oc0doQ6h4usksg/RdH6eXDodqizoy2kRZvb3cD62U8p+uNYUrsEc
	dB5NubLouL0z14VlcRooKdGLTQUeN0mtDxbB2Bq4X8wOyctJ0PcUVFHAm66hqEYpAbx3SIPlIY7
	UQa9dkaTEtuedpPeEd0gkM9bBkouAge+zmJSNtEja4zaKc1kSqckArNtz55BxLh3UJqi369cnTD
	uFBlaob0LcZFnl/VC2mIl/TC/3amDwE8tUXiuaNyqkcTomC8bfP+pjtb6rUbT+WdZpnaSQ65RoP
	UmZL8wigdM9eeaMerqUFIffwDrxBQExLGjxSrnTOXxy4n3c3EYZoTxAMZiA+uxSbzA/JTfnV3An
	iSUQIoMoiAw1IEN4srwzPSJ+pxcA==
X-Google-Smtp-Source: AGHT+IHrHxXdeaPG9B8IlHKEHEVk1KBLXqnoXcB8NheI8LMoc58AFyO+W+Fv2Eq44g8cl/NgunqeAg==
X-Received: by 2002:a05:6402:3788:b0:615:38e6:b739 with SMTP id 4fb4d7f45d1cf-615e6ed456fmr7575534a12.10.1754298287331;
        Mon, 04 Aug 2025 02:04:47 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:46 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 10/10] platform/chrome: cros_ec_typec: Add default_usb_mode_set support
Date: Mon,  4 Aug 2025 09:03:39 +0000
Message-ID: <20250804090340.3062182-11-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cros_ec_typec` driver currently doesn't directly consume a default
USB mode value. This commit adds the `default_usb_mode_set` function,
enabling the `usb_capability` sysfs attribute to be writable.
This functionality allows users to dynamically activate or deactivate
USB4 mode on a given port.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5a3d393c26ee..9bfe78e315fc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,11 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_default_usb_mode_set(struct typec_port *port, enum usb_mode mode)
+{
+	return 0;
+}
+
 static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
@@ -140,6 +145,7 @@ static int cros_typec_pr_swap(struct typec_port *port, enum typec_role role)
 }
 
 static const struct typec_operations cros_typec_usb_mode_ops = {
+	.default_usb_mode_set = cros_typec_default_usb_mode_set,
 	.enter_usb_mode = cros_typec_enter_usb_mode,
 	.dr_set = cros_typec_dr_swap,
 	.pr_set = cros_typec_pr_swap,
-- 
2.50.1.565.gc32cd1483b-goog

