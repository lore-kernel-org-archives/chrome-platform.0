Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD17145A03
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637170; cv=none; b=agdsnvphIAbRQWxBn0vm7iiwBOrIpMPEdqpTERFPG+HdukQ53vt4G7OuI+2KXCV54jQqVxhUyRW1JrRpCrFE5QDxBGZaWR+xZdgAW9h8czS/r/PFxYe3Oo+v/dVKHCNZUyTADLJQw5JLwkTEVQDDU/NFG6i8r05O8ValKi2+IDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637170; c=relaxed/simple;
	bh=zQmuZ//7F3rYkYCDgTClMK208117wQ10a1mu3b/qRdg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YvMtY+EHngbSLDz/Xtv3OIL2PVKwScL1lyf36VgLxveky836qHwZ95yTav1r/xe7QPfh9hPsoiB+q0nsyxDjF1bh6BLrDUCvrEczez8JAwJHxvYH+ocBK8vl27ddPeFyfhFzKXOtbKuVVuuaEUdFDCyyQP99ufizsObAeLdEWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NupGmn6B; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NupGmn6B"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f075a828bso663445ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 03 Feb 2025 18:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637168; x=1739241968; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PR6gBOJPyvjOyN9XG3Z34pMOOrgiWkRykhimhvg7tU=;
        b=NupGmn6Bn5FMu24hU9Kh5kk1yU75Tz70xvCzoIh/Uw+EAsbotKO6H/Ze0JPVY5sFep
         7RbravGvs6+s17dQO9nKRC7WkCo5GPbxi+84AVkJYsssRA0Y7+/JssdTt1mcFCPYNMaM
         SEudh2sQb9ud93PxZnv+Xw39874LNu0eP2X49/ac8SLxmnmpX0sl/kV1gnQo19AN3MpA
         8vUAZWMYCivK85QiiZ3OLEnaOe2WRhEVQnjzrQrIiEsHpmtMj7wlvRLOsm1sPnSuBXk3
         H2537K6bR+Td2xdaBqFBDscHXEWroBB2HJ49CHGmHu/1W6nC7uNPNBWys83XxG4nXIgf
         hjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637168; x=1739241968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PR6gBOJPyvjOyN9XG3Z34pMOOrgiWkRykhimhvg7tU=;
        b=A3YrrFs6l9M9Irq2ywbloS5O6pYXCICppwn8MQMQNyW8cqvj2gOxtbeihcPb+8+Tfr
         YDjQU5TIPqssLjvEr1u+GpjIhcNa83odiYAWGuBC/lP/ObLDePXKEUqOJS8gTJa3nq6H
         Pvznc/4yk9eJwfSAYWaQ7S/fxbMrfzmJr6RWy5hWA4n1ETnCUbAsIMvyfctOERwjsMqS
         ACTPJDrIidmdAyf3TNcgz5UpN9LKl80wdQB8SLuA/14iDrW13ldZgnhLVHgsRVh8/FqQ
         bq+VuZNJ/MnQKGWxRIJeka2Y8zoMCLKF2dJnlxVZnC559N1tNTgeueZWEwcJLxfTEOzt
         MOtA==
X-Forwarded-Encrypted: i=1; AJvYcCWb2sr0/8d0Bhsc2x+ElKNUe1sDJUInpvJVmNRtX5YtfwI3VhtSEoKODOuU8CCbYY9RyptJkBgb4CSL5VH2RfY=@lists.linux.dev
X-Gm-Message-State: AOJu0YynaskLCf3KMyRgz01e4oannNeIfRT2dkk7Pt/zghjG1m26G5Zp
	yLraJP3j2S3WAg+VP5hnP0n7+OCcPn+3m1VJ2ARMmUTHvvE5yCc3vdsXtsCKPbMS5iiMsvq4n+7
	t9Q==
X-Google-Smtp-Source: AGHT+IF8jm9iEQgFx5P2DbKyMxCk6tB3nRShajtAH3tS0JvuQtjgmZljPqCAsCZPOXPaj8YAHSe13Rn0TcI=
X-Received: from pgbbx2.prod.google.com ([2002:a05:6a02:502:b0:7fd:56a7:26a8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4e:b0:216:6c88:efd9
 with SMTP id d9443c01a7336-21dd7c6290cmr420570785ad.15.1738637167912; Mon, 03
 Feb 2025 18:46:07 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:58 +0000
In-Reply-To: <20250204024600.4138776-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-2-jthies@google.com>
Subject: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
On platforms supporting UCSI, this host event type is sent when the PPM
initializes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ecf290a0c98f..1f4e4f2b89bb 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
 #define PD_EVENT_DATA_SWAP         BIT(3)
 #define PD_EVENT_TYPEC             BIT(4)
 #define PD_EVENT_PPM               BIT(5)
+#define PD_EVENT_INIT              BIT(6)
 
 struct ec_response_host_event_status {
 	uint32_t status; /* PD MCU host event status */
-- 
2.48.1.362.g079036d154-goog

