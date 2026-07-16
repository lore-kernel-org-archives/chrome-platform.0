Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625E322527;
	Thu, 16 Jul 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187854; cv=none; b=dEICpywFMecxZ3MXJEo2N31DXMWKfRIMWm06Espe2mN/LRMXco4Aq+k1xQOlEEYWrTcopBdhIK9lWXqw1Khhqzvfstd9338mXOhJD0WeL5Cm8OpXWUJ7JsvPc3mX3aIn1lKoFr9bGn3yqRJb1Ize9Se3h+nOXXSD/9y/l2qP6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187854; c=relaxed/simple;
	bh=raeZ2wtW2RnMJtNUGn3WTKghMAEFo8Utb7mV/WHhkuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQEwBtJBKzP5DHUYNylGQqkrCi7CyNRbTnAIDAmLTbTD0fGHPBVIir4FWoUzfLHPCxPl7kP6aeBnn/uF1zPkYzcRf4SrLhDHaXYnldaNoauNjxk7CZji2nS6g9whQGY97w26A7CN0cNbevcIc9R9A0JHX0FunLvNGggn2tnhiBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Btw3AdYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Btw3AdYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9021F000E9;
	Thu, 16 Jul 2026 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187852;
	bh=rYqMEwEi8oWm88K4QSs4oCDQPApmu61NhVuNrIgqYtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Btw3AdYhnebw65qrxcUpbelZl9bfudsi7CtJe//4dkN28P+IFg41M6yZHmzfqww/+
	 KJqsnvztrkxj5zPQVocLqQU6VJ+cK810g5KRMEvWpAWe+M19Kb/eIdOPDRpF9w0Fbb
	 pDAq/S5KPKZD7dfF+63Fdeoh+iU03Ls198xFbS7SxMcyMYBPj6H4ZbRlLvNsijd/67
	 RyN0JV/v81NFqbPEqDGkyvZK3Q4Rnkog+0kCwgB9fjQj4TJs/CHtuLmM0SlGsFajBK
	 jDW5WjqPsIk9W36ulhnmBLGByidgrTp0rez6sUtzJ3fH5lSLrHLIVFRmggkRIwZdTl
	 pmduMgVTaFCKQ==
Date: Thu, 16 Jul 2026 07:44:09 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yidi Lin <yidilin@google.com>
Subject: Re: [PATCH] firmware: google: coreboot_table: skip no-map CBMEM
 entries
Message-ID: <aliLyZOubSa6ARfS@google.com>
References: <20260714-coreboot-v1-1-f59754d71b55@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-coreboot-v1-1-f59754d71b55@chromium.org>

On Tue, Jul 14, 2026 at 09:19:18AM +0000, Hsin-Te Yuan wrote:
> @@ -147,6 +149,23 @@ static int coreboot_table_populate(struct device *dev, void *ptr, resource_size_
>  
>  		switch (device->entry.tag) {
>  		case LB_TAG_CBMEM_ENTRY:
> +			/*
> +			 * Skip entries that are not exclusively System RAM or
> +			 * Reserved memory.
> +			 * On ARM, no-map reserved regions are not System RAM.
> +			 * On x86, CBMEM often resides in IORES_DESC_RESERVED regions.
> +			 */
> +			if (region_intersects(device->cbmem_entry.address,
> +					      device->cbmem_entry.entry_size,
> +					      IORESOURCE_SYSTEM_RAM,
> +					      IORES_DESC_NONE) != REGION_INTERSECTS &&
> +			    region_intersects(device->cbmem_entry.address,
> +					      device->cbmem_entry.entry_size,
> +					      IORESOURCE_MEM,
> +					      IORES_DESC_RESERVED) != REGION_INTERSECTS) {

Per comments of region_intersects():
    Note that REGION_INTERSECTS is also returned in the case when the
    specified region overlaps RAM and undefined memory holes.

Won't the check falsely be bypassed if the region overlaps SYSTEM_RAM
and `no-map` memory?
