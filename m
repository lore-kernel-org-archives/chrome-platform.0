Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C928D8D8
	for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292788; cv=none; b=o6AOf6ShJFS1Lj73ij10VoHAnuKHW9dNtod9MhETMlE22sv+/NthaB+WsE6u9giHcJ3sQbIuhANLuUIFyUpI/T0pvo2zqToStl+Vpv83fphxxytqz2jaHXOQwbIIJhjdTnmg19+AfUQcNdqNKzYvVuniRTruJLu1nIfDu6igsQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292788; c=relaxed/simple;
	bh=qWGW8YbtsDuKpbmI6ubepotX+ijoTJp4dAQsUcMuZjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugE1U0QS+PjmvB6eZcAgzsJNE45LqbBM6I1VV81nXzyCR7mPWSwlxjYGhrGy1hoDlM+az72YE8dNjq9+OJvf/LqDf/cUCX/1in66Srv3clWdlzyynUEEh+BGo2bV+S0W6tnt78W8FcYBFMIStctawLqOO2HMLm7DA36OPCbHw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lNL2cGmS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lNL2cGmS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae223591067so385304566b.3
        for <chrome-platform@lists.linux.dev>; Mon, 30 Jun 2025 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292785; x=1751897585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=lNL2cGmSRMGgPj9PXvtgkQKlmTfM00mxhUihhIi1SnFuIXz7KrrqpjEGN/whUNcjL4
         ldlTEO7/HeFZciGT63hCo3tPJ3tpsQhKGcmuxLnR6krjzgEhcP5mLIzNM41vNPEiW5Uu
         SkM92ApXDT7UMoRIdaT0sT98r6pBmffszt0bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292785; x=1751897585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=hpLlTD6Q7WqW1MGFF+N6SFXAFsgqtKHbrpNU2C0Sxp+yNsctz9GO8wdfR+gXYmCrze
         xCRpuBwpgK5RQ3T7tIG19CrQ9M0lQj2Y3bGo02vbg5atUK2cizvF7pCRfcjJuqcGgvmm
         NNzF3bzMhEbM58O8CDKOZvIzkzVMBZZajgKDE3vAyfP/mvkdJHZ7SGsuCvt6wtU9wv3d
         Kg/1aYbTfqW25r+PNulbg3B3fUSasJHe5Ru/j7SxOnUpJrSYZa29mWIZCuIdrCuFyZrY
         rcvFM826Kt5IcaXr/JXyju7x3HrmrOvSSn0uL9LF/uW7Zk6HyyKLq3c8gUZdB8q7bEPf
         FJsg==
X-Forwarded-Encrypted: i=1; AJvYcCXS4nnQcjwgj+UKhUX/XkbUWSiL3gdQFxE+jh/Jp1PlHXYWK1bdoJ46YuOurUuqQcY7e0AdvHNcogFel/fMUfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWtZM97APR3jgOwY18GOSmXnMoralr9zmxcHMex4JfgNBZyI/8
	nOM+lFytRC6KsnMk4UP+R9uY3J5Yaze0vUUkzoBKVQjkXCjSm4HysmSU4SxmLlJVpA==
X-Gm-Gg: ASbGncsQ/IZDKi2fhGcFplUyeVcqZfpoM0lMM9AaBcTpXSVliNgJc1YSwAHLszxGtYk
	g47F3SoYp3B9+AAL/kLxURpPIK1n+6vcHVAReEhRfBjAU21uPFPmkUrjFOViZ4zBovBIKdRpaAb
	OSZuhfeVr3xPhjazZCqTYeauq3p/ibcTBLXKe19MmEbFOsb2iECs9sHouxHAlEDB6njdXLg210Q
	hDLKDzN+gRFQRj3TWnwt8AOXeza6gp8ACcBTtyrae3Dfjsu15Lw9HZUV2gm9KcjzrbyCMO8FUg8
	GNpYUfxQSdQz11cEomkZoeg2NVbuacbz+WiGOE9UBd5vo2/EIRpNNA3Nczsu5g3ZFymUtpS8QXv
	izuadsBjmaAADEXm+lmjbBTaxl/f8cC7Dxxq+hDZi1lrRHrDClTQn
X-Google-Smtp-Source: AGHT+IGiJo2J+7ysvkMPbSppys/RSb0riJCR/djRR3Vxz/X1CdlBlaaZmnA7ExkeEfvj0vTjvfESJg==
X-Received: by 2002:a17:907:d78b:b0:ae0:af6c:680 with SMTP id a640c23a62f3a-ae34fd3311fmr1153897566b.2.1751292785232;
        Mon, 30 Jun 2025 07:13:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:04 -0700 (PDT)
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
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 07/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 30 Jun 2025 14:12:36 +0000
Message-ID: <20250630141239.3174390-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.50.0.727.gbf7dc18ff4-goog

