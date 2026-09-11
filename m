Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D5476685
	for <chrome-platform@lists.linux.dev>; Fri, 11 Sep 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130256; cv=none; b=o9QdGL1HxUC8Qd9QTtpPvs0SpORVZqX+I5SJg3ZHuuVnzB2JKEnE+zJfJuIOd1cWJHpRYfUrGNwP6Ol47ACC4Dr3iL/6dErWUmfSc5q3IsqWq1xMUFwUIGDJ3sbCFpqgOowjZXfs+d/EswQ6BHcmI6ydDpOH9q4NWfI7YQMUA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130256; c=relaxed/simple;
	bh=GuuVBghfGCVvQ/+kzbMvCYEvoy51uEMX/UGIBGJD40M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAjdoeu7ZcKIssrFBYSrGYLVcyAA2uKlE+qkUOq/oZ96/vwEyCtCvmuCIwFgNz8qTJ5rwdxL2DLqIYVXHXk8mbpsPt/9udZRP+bEkVtrqiYikjWCbn7tRTWHi0T+9RwhFNx8O9mPdl3/SS+ns2hNSjXWo9jGM/3Ooqd5at3kuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcpfkQE0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcpfkQE0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso7541195e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 11 Sep 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789130253; x=1789735053; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IARta1QCIhWwqo93R0Jyn6WRkcbpvjXZcepUuFCdftM=;
        b=NcpfkQE0jt3SX8bxUAlExBQyQUyiEGQ2gNe32WYdkEJ1CnGV03LYD6yj46cdbJztL/
         oC6sQj68+VY0Awo434bMU9C417NKouQHJG/wI4ynbpg6Cro+uYYICX93L5VaZ4w7VgNX
         jyi7f0gXWHN06gQI1MCsAQl47puDLf4MmjGu9gpaoJSLGhu3p7VRHWYUYDDYDg5hJskJ
         vAS29RQsc4J4iDiSkyznDf2K70a/yIU5hvmqg2jV+RdWzy5Y/q2TIfR09AI/T1FBUFKV
         SGqkFYLD6qEze6Eq9sXpyM/E+7ySrEWB575NVQkNMP+n9TQy6Uj3M9U7x37+TOBS0Q70
         84uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130253; x=1789735053;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IARta1QCIhWwqo93R0Jyn6WRkcbpvjXZcepUuFCdftM=;
        b=m6F0sHrmPK3+g0La6JdrCn/1P3mjxeewA7Qc+CvLro5MS5Jxs+NLabVelwbGaVrGwL
         XQ0zIcyvNoqbNq0w0mkKe8iQLlCEWKrhhY90DhBzqLLO57UAEzdFR4bqOhcaB+A1+arx
         GXVx0bBixuX6WmTCE4qzo9AwOYOY9oRXy+YbmrNGIRYDCvztuKIUZfMcYDGGMY+r+ouo
         k5pM0tBq93s07eTmi9G4O5VbdjoHQJc1YeybSBxPEseOoCcc3WpQwBtagAClAeYJyMQE
         qa+U8OuLXpXANVQ3M96tgFM57RiD5yizYJrtRnwCfxcrO+hylE7d5fo41W8drSZNy6AW
         KF4Q==
X-Forwarded-Encrypted: i=1; AKwUvByfuxYcVbGVd/OaiVeQUwUk9GTEOpMyPJ1aHRpuCS+/Zgr+ZcG+QqNPZfHCeV7TSgwbq3tI7118dSaPISLCD9M=@lists.linux.dev
X-Gm-Message-State: AFuF++m+LwZxPBCPYe81Loe89Px92eBYCSXPaO2+3T17GbaIErB6aiAm
	5Sg1vdELOjrHhqoawuY145S336L+AiePB2s4wV2NENtizxHjw0jpMPJ/YbtFvmm+5IzvHg==
X-Gm-Gg: AYBFou2z2CkznfyQKQvfGov8nnzyTVLb5iifDiJo/hA//hrrVgzRUNhBB9eHBe0C7d/
	BwQ2vaNaXhJ3Sttm2cMDrqRRtJw69dIQ9Hvo7PcYV+V7bFAtXJypkLdUmpowD/I+FrzWCit1PaZ
	K7KYCzvK8StG+ahM7qh6AVwgfHQIoqRFgXDTNvW0Cdq01JJyBwzffGsjOb2vjqQp4pTrF+SrWmB
	dPzsowldk59yo3AAyIAecGy34FR+ooI+QlIsIhFimJp1i5RxZrRhxAHeuBQ+/3lAXg92ReLgp6b
	PhscnguVga+DUP18b7Ki13iZH5PDyrfc9mos6SFvwZ8rzzadsPnyDK1hYeopwCQzhbja9S+DX1e
	vN8Z6dV/N1dPiZMCggOHcGAKM2qjBA7PZbfE8fHJNSGkJ8rl8QZ4bzpWOl80aseJOl4ue6lT5LL
	Icj5vN2bloeR3VvNH8+l5TSSJFQ7Ns2Lm6rOzgmlAwqtPRHaYBsdHcKczk+MOKO326yEs=
X-Received: by 2002:a05:600c:a45:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e619bfea6mr52704735e9.18.1789130252515;
        Fri, 11 Sep 2026 05:37:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6687a1basm26762985e9.12.2026.09.11.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:37:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:37:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [bug report] gpio: Add ChromeOS EC GPIO driver
Message-ID: <aqP2CHazflMSQrfa@stanley.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Stephen Boyd,

Commit f837fe1bffe6 ("gpio: Add ChromeOS EC GPIO driver") from Feb
19, 2024 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpio/gpio-cros-ec.c:131 cros_ec_gpio_init_names()
	warn: expected subtract in snprintf limit 'name_len'

drivers/gpio/gpio-cros-ec.c
    97 static int cros_ec_gpio_init_names(struct cros_ec_device *cros_ec, struct gpio_chip *gc)
    98 {
    99         struct ec_params_gpio_get_v1 params = {
    100                 .subcmd = EC_GPIO_GET_INFO,
    101         };
    102         struct ec_response_gpio_get_v1 response;
    103         int ret, i;
    104         /* EC may not NUL terminate */
    105         size_t name_len = strlen(cros_ec_gpio_prefix) + sizeof(response.get_info.name) + 1;
    106         ssize_t copied;
    107         const char **names;
    108         char *str;
    109 
    110         names = devm_kcalloc(gc->parent, gc->ngpio, sizeof(*names), GFP_KERNEL);
    111         if (!names)
    112                 return -ENOMEM;
    113         gc->names = names;
    114 
    115         str = devm_kcalloc(gc->parent, gc->ngpio, name_len, GFP_KERNEL);
    116         if (!str)
    117                 return -ENOMEM;
    118 
    119         /* Get gpio line names one at a time */
    120         for (i = 0; i < gc->ngpio; i++) {
    121                 params.get_info.index = i;
    122                 ret = cros_ec_cmd(cros_ec, 1, EC_CMD_GPIO_GET, &params,
    123                                   sizeof(params), &response, sizeof(response));
    124                 if (ret < 0) {
    125                         dev_err_probe(gc->parent, ret, "error getting gpio%d info\n", i);
    126                         return ret;
    127                 }
    128 
    129                 names[i] = str;
    130                 copied = scnprintf(str, name_len, "%s%s", cros_ec_gpio_prefix,
--> 131                                    response.get_info.name);

The name_len is wrong because that's the total length but we should
be using the remaining length.

    132                 if (copied < 0)

The scnprintf() function is a kernel only invention can never return
negatives.  User space versions of snprintf() can return negatives but
the kernel versions cannot and the kernel relies on this behavior.

    133                         return copied;
    134 
    135                 str += copied + 1;
    136         }
    137 
    138         return 0;
    139 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
