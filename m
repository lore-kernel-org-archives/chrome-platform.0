Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D22E2EFF
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080807; cv=none; b=WhHv8BanOgdbgjw7j6R5uQsyuN59p1xaAfw/3gnmYi8biyONfv3D+Sh7hndVSFYvr+wxiVcLTjMKHI7thfa5whsuniuUxtScEct2FRuwQfQdWbew1ETYIsJ5bFlhrn9CWDakw6DdY9ThDPAkQY9XEL8jmFVzne/BVPCJTfYgneE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080807; c=relaxed/simple;
	bh=p39s08lBsdKyWiPzDRau2EzpDZFXgqJHAiwGMuq/Nwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGI/qDqxmmJyemdqghuShnd2uIqaBI3d5RaxVXovARQikF0Y0qdJGT6KRcfZGEUNoiWFuDh65Vrb0HWL+MbYFRJVnbVtlgPXPrH06ew0Ml6R16QVhXLia2wb9ZUk6nI5KBgZZuU9nU+l3xDWjNUt1lVl3ZhqBJ2/Lq2lWRXcrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q7dtp6vI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q7dtp6vI"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6828356a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080803; x=1750685603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=Q7dtp6vI1354eD6D9eqecPGewaal8VgMNBVe6VA9pvPcwEfnGoz7z+f7JhGFGCliMJ
         h7CRBdSW65HUipcfMmm++b48mVssSObNjX+NJ6koZi8SMG4VYyvVgabt7PLWP00kBIaO
         IAKDotAJ4t29WPiiSQU8mxXk9bqurmuBsj/sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080803; x=1750685603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=bugMj+8SM8K6WJnrfA/pmZuo5KGtnQWF+o1LOaECSHcj2tuejO9iKmHxxwMPG9TrO/
         ieXS8chKFAUFaumMJwZrgVELFNXkWEx7HSaI7gk++s/jk2RCJViLD+bh1eXYXDwu2AKi
         Xt6X8fRxaVpFMg6TatlmUhWH53yU9S6xPUj0zi2tDCTsUl1DTeYjbrjONIDOJEH/9gRs
         TsX3PtkF0M/6bKNQ/4pJHwrAzeq9rGrOnqLjUj1mmHcaelFvHk3xa9KTUYS/BfnH6eO5
         DDcga7cABE0w1+4/m+dCgIFaaA2/fjRQ3saP+gE7SR0gchvylu/HhfAWs7zvYufZ6LtX
         JLOw==
X-Forwarded-Encrypted: i=1; AJvYcCXFQVK0U4r8fEzSannwhOkS6TaXp2CUPrmCgBlqmIqso5jF7PV1kVh4JS0/UzZXjTXLo1TQq+FmIBfhTkAvTUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO+8pnytz7kaoqhREk/dC5LqfkgPpiS2FM23UgFBSzCEHpcENj
	R385ydLJxvOLIi6JRN3r8K4topUr623MKfMXGOLYyRlFxxZ0bSQs6kDPQd6aRXMvoA==
X-Gm-Gg: ASbGncu+VK2/r7hBRHOa4s4mQ+i6ydFaHOpOcnLD8ERrxt9u3iL4tt2RmaAq/a4YMEC
	BQ/2Ku6DJCFc16VqBhKAabb0sswNCf0RmfcUjFkS6XGus93FAtwOTiCLIKFpWNDJRVp4Y5kmxlK
	IwXWSS8xvTK9aHNQd9p/OXQ2mpnRn+HnVIzhQjXmNIsnB7AcFG70BLKntVpYle08Nye6WrJQbDQ
	0qujlNqen7/7gHH4ssw4uLO06mSdpHrfeGiZiwThhC/xqP7P+aR+c2O7WfldFOtzH5Ymy/oyXGt
	PVNoh0hoLJu4/lFMT7zQUGcn9x2SBTlVXYLNszfyd3izHoo9zKQrGJFeugeO+ocF7I24xsvsCTJ
	TBCAMd0ef2hcFbiiZiTtKQmyNp77w6T3G+YHWDwLkufVvIm91zyqxcgOANw==
X-Google-Smtp-Source: AGHT+IHW7N4V3Xmd80K442egDP5c14Z4Wwz41/QwxRTZ4VwR1xjfYPTBJjTabMbR2EIyF9mo+GlBTw==
X-Received: by 2002:a05:6402:348f:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-608d0835bf5mr8908309a12.3.1750080802251;
        Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:21 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 08/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 16 Jun 2025 13:31:45 +0000
Message-ID: <20250616133147.1835939-9-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `DP_CMD_CONFIGURE` VDM is the final step in the DisplayPort alternate
mode entry sequence. Reporting the error code from this command back to
the Type-C mode selection logic allows the detailed result to be propagated
to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..6f754e696d93 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -241,7 +241,9 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
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
2.50.0.rc1.591.g9c95f17f64-goog

