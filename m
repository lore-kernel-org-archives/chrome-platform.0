Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510C1F3BAC;
	Tue, 25 Aug 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787626616; cv=none; b=jo9DBvfr/0MfQ8CAL0a2dWG78w1HS6LxyshyAr1LCo+Unu/IY4SYXhErKLFWj6/nwNUjVhiVU7x6sl3Ny9P9p0c63B8i8Y1rWsPB7KttAFxk+By+T6Hn2gGUqBXi6QyAHdxEjcBswhF2lxoz08A4rFUnTqf+rTe7bPTP1Yl66yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787626616; c=relaxed/simple;
	bh=ZqatO8Y7GBMj2yF6WMSrHxFb3bbFA/fhINAKGt4cJtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ao/JFxjYl2NwaWdV3H0Io+jnFPDFdBB7ZhhrI6hNJeP9zfpkCwC94ON86ffaGGWQb5ht3HLCM/cy9fNnVJq/TQv6xVwjllOJ1sGC3ro/Cj801HpDkad2IR3+VUXUbmdXWSzgyvNBEWnBgX475dYQ2F3o0sTDclsBTJqx+FAQVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGZFq43D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGZFq43D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5301F00A3A;
	Tue, 25 Aug 2026 02:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787626614;
	bh=VWuywCJyLj5rsEUnDMOPsqV2SlXVHcwjCyQML4lLaaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hGZFq43DJ8d+CIN68W2X1mnlfjzpX7NmHvhk6y0SqOIzg65j8KJZI3oB4bnQLk1og
	 PDN5eSDrEDZilb864NSo+t9WdRD4PyDlgp01/8S5cY92DJk1bq5VvSRJ2hJ9iAtd2w
	 U3F3K9dCEKFg+Dx/YSMk+XbelwtIU+tMxP5uMe8Ygcn35N9c1dFfkJxRAR+OSEn8aJ
	 Uszeynb5y7coQ3Ezvl+d9iGzguQJHgmOL+a+0l9iIsnE/Ah6mUSlShJ6lQsIMfBKW7
	 L702FLLyob3dW21m0cekQ8r0M7pp9MiqdoU2eIqyHVZ+VeSTQ7t4eYflo/8Q9KWQIk
	 XvtNJXXxsVeTw==
Date: Tue, 25 Aug 2026 02:56:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Balint <dbalint@google.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	jakiela@google.com, hmazur@google.com,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec: add API for power monitoring
Message-ID: <ao0Ec69RhunTZWfQ@google.com>
References: <20260824155554.1046334-1-dbalint@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824155554.1046334-1-dbalint@google.com>

On Mon, Aug 24, 2026 at 03:55:54PM +0000, Daniel Balint wrote:
> Add new EC host command and MKBP event to allow cros_ec_pwrmon
> iio devices to query the EC for power monitoring data.
> The actual cros_ec_pwrmon driver using this API is currently downstream
> and will be upstreamed at a later date. This is a sync between the EC
> header and the kernel.
> 
> Signed-off-by: Daniel Balint <dbalint@google.com>

For my reference,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
