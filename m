Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E931A256E
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473434; cv=none; b=IT6LinOUMRRAxKsw9M0eDpd3jP9WgiQE8uTAsisjbzw7vrYfIK1i9Y21Fiym3Z4dD5zymoXavgLWRnRxtV12GF8WxtRB1dt+LN1hJaK9vvvP7StjCFdtVZHyPFSQjOxzzQ+I8azpKKCsiOsEwCsKO3HcIvgN9Z48lwQOKvmUUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473434; c=relaxed/simple;
	bh=bVmYZCvIg0fuqjElUFCUghFOqlB1ruVviQKp1Q1sy0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2bzqljr1QBRLvDW8JyEHGZAC+lYkZ+biiPFJtt4VZPCx4C/3kM/QE2MtMKPG9DclAFdKnJhzl4ENA0k6uo8MeQNxmiQl65fh+aN1cbO0jiYiNSyVRBzMfOHosqtv7IaQ4hXRCkfc9FJPjePYmFWS7kVGhlqAvayby1n/WYTBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc24+Adp; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc24+Adp"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81db1530173so2614908b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473432; x=1770078232; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=nc24+AdpWvX1y1TYpzW7TxpznCE2EEuI5fB3o8DMn3nD6JCb6Alcsain7aH6VC/oPk
         hl8qtSQcazudU8SG1XMdlkpp8HhZ5Gu9lLFPH+eP97E+wL2hcB3aTSyEsgQ7WKxerk4V
         6b9VIqbeu8Lun/tiw5c7DSyIQDxiVkDr/2cPQPORDnutCMS9LxNWh3nuGroqnckjKeUM
         CDgO6QxZ6w4fKfVZwYrXVqXWtEFLlHC30Ht52nXC+gzdTEbzUVs5Hak0qNu1vSqA1bJw
         UnbJt0btPVrwCJrKz8XT7WpjBlXCqM2FvPbKCuOQJ2ZUcIPfu9A78oA63X0a+5pWsb+e
         0dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473432; x=1770078232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=s0PZa3ebHIX11PrhuFnpSPa2U4L/PP/XBrhpiP0c3U7EF25Tig5RXoDAXL2YFkiG1B
         PKwkACsI6L78cVCdqM9TcKmXwXKr0EQiESSQPAxcqZxt31VxKk3Yw6ulHqgpUwq+xgZ4
         u4pl33Fk1pVcNonZFTxYmc0kEkKwBQKduC1pnNtcF8Iv0tUdYYgCIlEKZG+Iu6If7jTO
         UjSkPtAQG7egXwRXIBchtkstrpY10jFQPUgLeTxWMWXRpKuzsEaghGQubL/gijR60cQo
         zTq+h3TXFspEP46MVF0lmmMIoI7FeGVC7izXyExzzRlN8REKb4ha9G/cVL2PjSj5tQtb
         vIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKyFbIcNi1XGnpb01mvY3+V086lk37mQKPqxZJxpEhR86YLsTTXFdkt5c3KU6YCNny3Cs0eDFjPFOQKhSHgPk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmO68nWZaIoudBQpSx1Iiy0j6fCnWsbJlbvt56RClS7ZJAeveX
	43gziUyfF1syxIg/ygmvKyUMZh64bsFcLRlVQ3F+9kINAG0UuU+yvWjU
X-Gm-Gg: AZuq6aJIUW3FFPeycuuwah5DBkJAlJ2PFFOn6asYwtd6XqMkv6yskgoHKCzSRWGDi1m
	E6jTXMYH0i3ZvB4i03fCjCIgfFRQPF7soRDVRl1D1Qwik4BnKhre82cSvhkcQ7K0HTP0GZ4NELm
	1qEJ72QqluVpUUd2ZgVxKoSt3qOxnLX98ujn/QTb54YRqL0FIiXhyOaZENTRXifYIc7d+YmvIwN
	gdO5EYiPT2GEr1PqZyiHQbr7byupMgTGdeRF/XO01j7DmkLPwGmyj4SBbb9/NU4RwQHDFSzA+S0
	DwTAnFwg3hhtqoKF3r/cOsSJK3GuIHSesmzdrjRw3KL7pQ4MILAXsAqAk+mNWHmt/G/yCEGvGFw
	IqJ46Z8it1Z1O7ALnceegGdvh5YIe3zVZXcQx4wSC+RImY9ukbdDj4E2Hu5JCTrvTZ3crkYEJg3
	ABZzMovWLazF+LvM4G2H7E13wh
X-Received: by 2002:a05:6a00:90a2:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8236916ac21mr31129b3a.14.1769473432307;
        Mon, 26 Jan 2026 16:23:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644bcasm10315629b3a.2.2026.01.26.16.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:23:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:23:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (cros_ec) Split up supported features in
 the documentation
Message-ID: <6741ce04-c51d-4c21-84f4-c7f26b298b44@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:55AM +0100, Thomas Weiﬂschuh wrote:
> The wall of text of supported features is hard to read and messy to
> extend. Split it into a definition list with an explanations for each
> supported feature.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
