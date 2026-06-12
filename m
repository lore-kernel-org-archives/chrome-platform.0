Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D2349B0A
	for <chrome-platform@lists.linux.dev>; Fri, 12 Jun 2026 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298088; cv=none; b=rPp+lOmELFu/OMbKzoxGYjvBwcI2nbhGT1gHGOnVtWXbxdBFmaZpTjvBjZZCsZ/zf7GuevIw9k4RCVcxptTDatW6dgd0xoFCqHbB3QTLPlrEAuGOPund4/Yi1AP5kcDzUEtVHzHP4ZrIuL/t7n6lbUTA5dR0KKc8dSBH8c5uX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298088; c=relaxed/simple;
	bh=oburyEKCpXuDVftVaENWbOpIpPIMNuQ/fY9WHnBXP7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry327AgDri2idxZDYNhDAC1UHagwLOwg4EYFNba/XQeEpwMWGN2xXD56T532xjI1fBZPWsQcryQi8s/0pEgMOVYAjKZG09U9RBB5gkUbCJJlRaB5yJBVByKejb2pb9HCvBi4MqoPwUrT4jXUFGn0E+o33nuf2cbHyt9fWdngcNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NHmLJNZn; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHmLJNZn"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3078e0dcd67so1715861eec.0
        for <chrome-platform@lists.linux.dev>; Fri, 12 Jun 2026 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781298086; x=1781902886; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3tk2vHn7Go7waOK/uRrEz+o2vjWboPz0LvibdeAgOA=;
        b=NHmLJNZn1g+KMvP3q5yedHN9IUx0P0LETkgp7vByZTeGOdomAa35OpMdDd2Qu0xv/Y
         zaayIdoVlmHzgtbhR8Rd/yZqTH58+BsoBFLy/eOF8D6+QelaguGt9QIBKd9D2oCwtjwX
         GxCEXS6mTmit0SrZEwImKH8SuSxRDsjTUHhaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781298086; x=1781902886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3tk2vHn7Go7waOK/uRrEz+o2vjWboPz0LvibdeAgOA=;
        b=eXi7A8/sbZcE/0+Aosts3EwzCEIPi0TCNwGzqgOK2HnRMJgDRipjfVdXNuE6JszAPk
         UBRF9I//5gSgQ7eQeCA0Lq7TCLKiIIkc+wkb/8pWW63zvEJHV8ST8fXwV9Fz4ENOolHt
         lVg7pI0ht/VDGjYeRsdWjWIVu4kH2/m0zyNOx2yGwnNxjh1DX1wrjpnQoziuzBXp9ozM
         U1BDMptn9XMi2hd5ycMwOA8vcQqM1VDqI3PW+Yue8/Y563VMjNrJP0qnP5dx59IonJfl
         nF3Wq1IEn2Ybis9eQAlOZtxx6xiBE6MopwBLA+hi6P37rtzyj34sSSiIuhOqUiXo3ff7
         RVGw==
X-Forwarded-Encrypted: i=1; AFNElJ9H18Kskf6ioyXUKj1u+yekZF6Tz5WZLd215+xmb7zm71ghbq+uVD93jfOFyfn0chawPaTAkZHeBQYtsHEdut0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgG6+rQs/2xxRc6BGgOAFkOFMwhtRFWPpI7EcN9MnHip9utQ7s
	XaS/SiaGhvO5gildQL7GI+/nzLoMkL+KHTeq0EMUT6cXduf/tCO+TBk1aSlEJbZAcA==
X-Gm-Gg: Acq92OH1n3f0KFQuudnI8kolL9wrxRBQ/M0t1A5bw28/LNpOV+a360NYmNKROyo+EIJ
	pftAbif1xRRjTtJo4T4LuBcuWbW/K/bcZi4LNe0Bldgqe+7lHjtDbEZR1ABhcZshAL3gAZxF+Bj
	+1Jq6nPwedsXB+Ae5ZZ5sIoduVYhsIbiJNCU8h7muy0YPOgEaiE7HG1xatguMQVruldWV98eX4B
	NWMkkNpJoquAsy5HnNV+FKi0r2o59vRXIE9kVa6XbIUh5rI21pmDZSfupykPf++GhDJwwT+pymF
	nuKV+W5GKBYLrVu1BKHrxFun3qbdFpGDhm3M6gTe8qjuOYj9DS2R9pGrQGgb6ddVb8VBiE4Atav
	X6MscuMeIA9sGhPyBr/O6Ow40Atp2PFJB6xqQyMEiF6O0G4059xtasbDtuNztlAEQkS1mIms202
	l/3vUmrZokgrsPP+8Szj6fKdJwqtzl7kzg2RAykXxdtKWCeecV/DtHkgneNARmTw==
X-Received: by 2002:a05:693c:3945:b0:307:91f5:93f7 with SMTP id 5a478bee46e88-3092b94dc86mr777141eec.0.1781298086050;
        Fri, 12 Jun 2026 14:01:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:c879:81a7:2a21:9ff9])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3081eb8d3c9sm4829604eec.26.2026.06.12.14.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 14:01:25 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:01:23 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] docs: ABI: testing: minor cleanup
Message-ID: <aixzo68Oq4M9cZXf@google.com>
References: <20260612125111.187072-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612125111.187072-2-manuelebner@mailbox.org>

On Fri, Jun 12, 2026 at 02:51:12PM +0200, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Brian Norris <briannorris@chromium.org>
