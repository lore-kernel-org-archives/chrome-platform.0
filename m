Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B3524635E
	for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 19:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742235; cv=none; b=d35uBCjMTHJZ9+SNvRZsjMLMWTbxpAerNY8z5M5Zncht1YAYhkKWALfS/OaqcrI4ptuXahhGlJJCHLTX6nPS21hMct7dFg983iihpOAjSpwnYDvv08EPIf97kjWt2vkQNfAZQcXeEXiLzYgbAOACDA9DxnOYvUBbSTi/N0spXOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742235; c=relaxed/simple;
	bh=/e4i971/r7Fw/eEhFZtksigrKbXlOazlZrmnop2pcDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhiaWoaGmWmkS28hfcRKiyrcTl/SRkQRRdT4gBG7qr5eY3jr3QRY59+1c0mM3pneTHE81Aq/0hbaRwh8d+COcnzB2KrED4h5v16MEUW91K35/PUUyfHjhcHOQE/3wzWkuLBYSZeHnw73aHmHpKxCRda+yiNPlUD6iGxP7PyTseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLkVe2Q8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLkVe2Q8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26e68904f0eso1985965ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742233; x=1759347033; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=XLkVe2Q8aG+Z4IX5nSEXJCUZOfBhyIuWslMSDerSQWdgtWhobvvZ17jq7NZI2rupxv
         jm7swqzcBQU9PxKuiB0EfBJW09vziq0DYTLPx7rS3JvOurji/vIwidhKxQn6l6KekEZC
         mBzobE6okK88ad1JBQUiKPAUN/h9cVXNEvyVTvqCDID/7hBZ6T3J4ffnHC2sOLFzWWzx
         mn7NKuJeVyB4Px/MvTfojCIAE4xYgYQCL7LjQWLcy8osJYUKaAlDworYodYSwb2q/AgU
         qHMDB6K+n5nRdm34IeMAD+ChqND80Dr9nlKsJbKpgeeJKLX5ycxvAm5rmRGYXiBhnvPQ
         HFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742233; x=1759347033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUNFCslYIEFTynDU+6nP8kR8zycndcSpw/ZB7QnT4fg=;
        b=EgH3Ae0bUiBWol0PCmHRiz5c8iu4zCdY0aSewnPmV/sP7naEjZv/3kXnPmF0bRQ4o+
         /gcL//nZz9pty72tFeTrKSn5py473krrqZRPCZvPN7ooYdqb3DGZZfmJ0K++gZD4lPeJ
         jsARbSJJUlqxqCB9VRLZEMcxGrr9MqrJEWZsxS00Qc0WAHIMAExwMpo4igVsOK+g6Xpc
         4bhsyutjn4KeO4njfO3HSmSc9UobNdgGmuBguTlKXpbiKUF9rkSxTQ2oapKiy/rV6l/x
         pLgTxFw1j6Xe+v2f/RT7lgB1k1SQ3lsPT794/QfFd/c2Mot8dg1g0TjhZYIfHGi5MRta
         lWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRdTpMvLykUpn8sAs6boHhDouYEvADK96UVQL4avwViNm+3kU7HDWTNtlbN9iVTBKdjhScrFEyGGNUwkE7A6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUn1+/ro87eXVym/g+4MXZDEMNOPDiDB14IHlm9B2NdanyLQiZ
	ybWxfJ1S1x+xSfyL1ztMoKaquFX0mJVhX1UhMarOzTSthJ/rYPfVGrfi
X-Gm-Gg: ASbGncv09H2awCgO5CQWh1gmQtD4Kd5LGM3h8vvvqb1VU3KtfSlb1CwImswzHAXC+ET
	0LveXU8fW6BRN1b1mNhNXSpEjhcg/QWfCJ1mM65mY/ApJrpZR7zn79XOcoTCCTwB226GUVFI4Xd
	JtgfAU2q0IgU339MIG9IdqSm/whZ8EzqE9XoqnW2Sp90RMRhGs4BntOjTNF4BboFG+8g6hrPIYI
	f5qEUqjAkxyIzAKmrPpHMI1OhYSgTCNyPgVuVVAGU5M66+o3RttcvunYJmU8aFbEAHqO7ZUwT2i
	D/WadASdS4APXMb3hbU3/SJ67jaTdP/6blYOpAzZO616aIcw0QKQhCEwR9wA/y4Ae6M2g1ODMa8
	RIUG+JwFIUkKspcEsH6Yae8yodXzktWQv7vM=
X-Google-Smtp-Source: AGHT+IGXgHIPGwjBqDVM78HsNs0PblmkiXDMpBXIECEl2ksSHuLIfRokrz6fPJ65rOVTJopiGyU7Nw==
X-Received: by 2002:a17:902:c403:b0:23f:fa79:15d0 with SMTP id d9443c01a7336-27ed4a986e0mr7756055ad.46.1758742233251;
        Wed, 24 Sep 2025 12:30:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821d3sm181785ad.83.2025.09.24.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:30:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v6 1/3] platform/chrome: update pwm fan control host
 commands
Message-ID: <60ecaa03-8cf1-493d-84fb-16c0ae71357d@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-1-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:34AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.
Guenter
