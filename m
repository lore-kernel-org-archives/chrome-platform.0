Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6B30DD24
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760188; cv=none; b=cK8Z/ydVA+YZdbicM/fMrImeE2DVo4C1zsJQUXCbtDASI1T0hHAlKa5SRPW1hwdQIkvAtT8DefNxqjLCQAbrNMeJr2od+tTQWaFPNbRRqdeyk5zUv+qMV8MjKhrkz+XA/6ZfukKE58jVLG3aWIY2L1Z1ZcJBiWb6g2oD9D937e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760188; c=relaxed/simple;
	bh=2gx/gyElokzROme/lcWylnCZYSvLQLO1V21OE3SoAYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a18b1n+In7Tu6ci/ke72mhemdGJepmZLLmiH9uJL7wW01el+aeo4JGB4ORiSOOHjj8qlKl/UPGKLB/L1WvtybfVLTiVoV1fn2XvL/BJK3U6siF9nW0VBl6t64cyVmBm98QM+SZmJiJAGekx3hwvDmaMuSEzQ/6Z7hlbhNku5E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuqC/dpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuqC/dpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD03DC4CEF7;
	Fri, 30 Jan 2026 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769760188;
	bh=2gx/gyElokzROme/lcWylnCZYSvLQLO1V21OE3SoAYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XuqC/dpNzJgFowHbAzm3z1RKzkZmBTJPyHJDqSAaxSCCgPQsOClZwkxehsTvSUAoc
	 QVmvTq/zbgbdmsgCIf33EChS+ydSP5VleOc+fgCY2Iic7/0aKrIdjO4EP4LOoPvFZ1
	 l/rE6Y7u36DPK4B87xdcUsaSAiiJrdNI+uvuCHRRAj819CCMDGp4VnrsvR/o5kOky5
	 5CxOi5+4M3h6KCPGy4ZR4OGUMePJz3tptNux3xm2aldhpEJAYD9OfdJUeEn/Lh4JDx
	 F76xjIaoI1iuQsUJFsJ+8ObYtW7JCjY/Ypakkbnf0xko0jJ9thqxaEx0rjVDNtFAxG
	 5EU4FsSAzzsXw==
Date: Fri, 30 Jan 2026 08:03:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@google.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_lightbar: Fix response size
 initialization
Message-ID: <aXxluRAWU8KyYV6w@google.com>
References: <20260130040335.361997-1-tzungbi@kernel.org>
 <CAMHSBOWTc-gmT3f=Lrk=AnhxFe=MTkts5WTFLjQC14GZF0BXLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHSBOWTc-gmT3f=Lrk=AnhxFe=MTkts5WTFLjQC14GZF0BXLQ@mail.gmail.com>

On Thu, Jan 29, 2026 at 11:31:13PM -0800, Gwendal Grignou wrote:
> On Thu, Jan 29, 2026 at 8:03 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> 
> > Commit 1e7913ff5f9f ("platform/chrome: cros_ec_lightbar: Reduce
> > ligthbar get version command") meant to set smaller values for both
> > request and response sizes.
> >
> > However, it incorrectly assigned the response size to the `result` field
> > instead of `insize`.  Fix it.
> >
> > Reported-by: Gwendal Grignou <gwendal@google.com>
> > Closes:
> > https://lore.kernel.org/chrome-platform/CAMHSBOVrrYaB=1nEqZk09VkczCrj=6B-P8Fe29TpPdSDgT2CCQ@mail.gmail.com
> > Fixes: 1e7913ff5f9f ("platform/chrome: cros_ec_lightbar: Reduce ligthbar
> > get version command")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> >
> Reviewed-by: Gwendal Grignou <gwendal@google.com>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_lightbar: Fix response size initialization
      commit: ec0dd36dbf8b0b209e63d0cd795451fa2203c736

Thanks!
