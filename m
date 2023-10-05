Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAF28DD7
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V88SFN70"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkA09KRGDM7xxEmgV3SkQKeRd+1nriHnZ5/aubqIEAwexAv6Hm4L3iyAdkx/HrufqHA9YNFczU5S0b4bIBm9TXRid/IA0DaZViM7fpLcWqDgN/MoYY9RhKJ8GB265HRQcwy1h8iw1kVpXOEG5N2sl971sstJ/++6H+g47xSBxY2OYJnCGaqEE3niiqUDdTSThgkmR1GdnBpKJZkSdCKPJXQqsomOAarTjzd0JukUkar1dMTX3ebKDUdWLPmK5uPNMFg9aStFhYjB3CaKoBPlkfMFPyxcyganAjCt2J/2OSm1h3j+8qLd3LCYteUjERcKX0sZi8GRrav9zPqrtGgskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA4hnMMcfh7ipk3Gmo2T+9AeTV4u5h0mHR9xOEIjqXE=;
 b=kmFycmgFxG8nvnjDrcdDx/25orVYEeMRCMCz1kyULihr0UvSzRxF3LUEaSnRl8hi7BqHWj97YTTdrstUYAcu/e0WyIHZm3jDh+z+Rdr6jx4hcFL85ZkdJuBo0yBVkxSPmRHafzujg0NQg04bL3yhJGBvVxt2CoKDVbWX5w5ujueJcFmnnR/fK5HSi1ofTeV1tMaWjrd0p+ddYuy9bodrDadzXwU4ZpluHzoNS+nI0dThTkzi8PJEJZW3gtSNP3XTI4fVCS0363tolg3DyoYJvIZobxCNt8xnPq1L5WSZ/UopEcF5KuBFdKMVGjnuVGjfLBsXnlnm5uQReGSRaRoT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA4hnMMcfh7ipk3Gmo2T+9AeTV4u5h0mHR9xOEIjqXE=;
 b=V88SFN70yAeSDzEj8HRW5lP+oiPqaV38NGn6wDgc0JzYzJtflLgNn0w8a3jq2a8YBhuRvqwhmX3/JjgcYu/8KxYjGJ6qZSWz/MbJKRWBEd1Xp61GFLa/3AeWT4ndqIDzNsWk6MZ17oghjb/GflXdd1ouZ2lepZZuxO50jLSb5vA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Thu, 5 Oct
 2023 18:45:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:45:13 +0000
Message-ID: <c4e4aee5-4bf2-475a-aa9a-247b5c2d8b85@amd.com>
Date: Thu, 5 Oct 2023 13:45:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] cros_ec_lpc: add quirks for the Framework Laptop
Content-Language: en-US
To: "Dustin L. Howett" <dustin@howett.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231005160701.19987-6-dustin@howett.net>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231005160701.19987-6-dustin@howett.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:806:20::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a10e239-18be-48e1-8ab1-08dbc5d33587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JWDSN2gDVyS/j/+uCN3m3hBLhzWWzb5VXuBMVG6Cl+SQnGlylRjs4n3jhwOCcpQH28q96YZeRwgyoi0O4sOfPInTpBpVIVm93IEwwEwgsVtLgiYZn9hSF1gWm7U/NNkGXiUUXHEgcjV7ROc9lkWEERzpqQ5nFPcStQZMuHfHk8JI8+Kr9B/P8ApqHewKFF1/mq7ZdE3YcT09I0t7jRRnhUChFOMDPN6ZL9ftuXjxG6TBD6xrM7j/flpsJcUEupvHnaVqyPyv6hkxze2/6hDNH3bxxpfPfnxAbQy9ZJ4PU/K8DB5K8pymhQKW81nI3CRSFuxzyOd0028SdUDaNTUhQSPjv9Ht/4BhNOzYs7L8wqNE/H2xjSbwnkKwH/K6tnHVkL/ZJlkzFsH5AsUQAmKdfYBQ3DCroXQQrpN0Kxb8zayPr+qVW5tkFJLgEI+f+4EYj78dhby91EVZVAldIL2+/RNq9NXpLwJfofV8p3VXKU4EeRTPyyOLRm8Of1fPjPmonP9cZXWet+H1AKqfBZvVe4wKDIfwAWX/UP1QHT3sxqaDpBMavt9fFR3Y9stZCOkzmL01OPbR7U7jI4kBsiF/+2h5B3V9Xvj89sXdxdyAKWQcRciE2/1DzfVwqqezx34IsTRpz7mLz5EJ4jdKZzcVUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(2616005)(6506007)(53546011)(478600001)(26005)(2906002)(316002)(44832011)(110136005)(66556008)(5660300002)(66476007)(8676002)(8936002)(41300700001)(66946007)(36756003)(6486002)(86362001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzJCTmpnR1JJd0FFZ3N5aWVnNVJ2Rlgyc0FUcUt1R1FtRUJqdEplVUhKbzF3?=
 =?utf-8?B?NnoxY3VnNnQ4ZGpMd2tDTTVsbCtaTWpQdVVsZW1xRHcrQTVLVVl3aUJwTGJZ?=
 =?utf-8?B?ZGtYNHREZ2tWTHVWQkwwYW5USTcyWkwzQno1QWtpeFFESk1TWUx0UUtBendC?=
 =?utf-8?B?c0R0VkNETFptc0FRYnhkd0h6bW01YnBzRHNVZlVOZTQ2TlhqVGdKNmJESWJ3?=
 =?utf-8?B?ajFTb08xWXFraFRhV1p5aEVMRElVSzN0YTBCcmtXTWN1cXlXUElJSjZHQXBX?=
 =?utf-8?B?dFQranN0a0pKcm5vbWhlZmo3U3ZqTW9mQURVdjZQMUxlZXhuTWNWNnRyd3Ir?=
 =?utf-8?B?NkpzQjBONVhEclBoa3lUZjllbWo0N0hwTDJtK0JIeGdWODRyVUt3OG40REho?=
 =?utf-8?B?cEdidUZtSVBhUm1iazE4T20yUHJmTXJRbkFkeEZ1SVVBK0ZtbGFaREN2T0FR?=
 =?utf-8?B?c2pXZFJXTVZRejErVWVLMHcwWHhEamovbU15b2xPOVdWNWU1RDg0ZlBLMjkw?=
 =?utf-8?B?NXg1enMrQjB5NEYrT1BEQWVPczZoekxONTZGWjdMcjYzK1QvV1FmY01RNXdx?=
 =?utf-8?B?dHFHSzBmTFQ2ZDRwRlhnWnFNQUMvM2JQTEtOU3pZSmVtWDkwZkxDZ29yaVdW?=
 =?utf-8?B?UHlHOVhWRStDb3BSY1pVSGoxM2xDdUpPZEZYZWJPNHd2UXV4UFhlTjV3UjNp?=
 =?utf-8?B?OGhyYXgxSk84MkdXMVVrVTRpcy81eitZaGhESEZzTURjd29Ea3IrWjB2cjJm?=
 =?utf-8?B?WGlyNWkwVGpieFRvZ1kzd2V0cVBnOGlJd0lvVkorSnBZb2V3UEFWSDEzUjhQ?=
 =?utf-8?B?c2duS0h0L2gxalFONVcvOE5ZdUJkTkVPZWlsK0l6dm1VckhaUG5md3VybGZ5?=
 =?utf-8?B?bUhIb1J5L1o3Y2J0ZWNxRlh0NVFOc3hreGU4NGwyd2EyVkp5ekM5SFNDVWpj?=
 =?utf-8?B?cmpZdmYra1R3TTBsb1VFTzN2eExnYldwaDdrZGFnU3hCNUk0M2hNTW1lL2wy?=
 =?utf-8?B?ZXVJeVV5SlVwUXBmeXdGUncreFo5MmNndmJ2NEdIMXBncUgrZENhT1ZQbEsz?=
 =?utf-8?B?UkdXVDlLS3NBaENOcXV5b0dDVGdpcFJrelVYczVlMFNoRjdrNjdpSURwTUtK?=
 =?utf-8?B?aVJ6MDNid3A3VDhySkRKZGtwV0VKU3NpYi85RWhDdzJPTzZnc0ZRRWhUSVQ1?=
 =?utf-8?B?YUk5K3JNM0IwbzdaVW5GMTNFV3dwMmhyUUNHMXJNYTFoc2FETEN0U0hEN2NC?=
 =?utf-8?B?Yko3Si83UWhUWDJJZ1h0Q2VwR0txNnF3cEFnQm1MTFFlTVNsZ2ZzMjh5eVh4?=
 =?utf-8?B?bEpJd2lsNWY1RWVlbnd0VVlxUzY4TWtlMmc4VFVKV1hBV3l5czQyUXBtVWl3?=
 =?utf-8?B?ekFINjZ0UGRVVVNNMVdIV3RrMjNwdUljdThXTitPMGFyeHJDbTN3K0loT0cx?=
 =?utf-8?B?TWRpMjNXSTMxb2k0NWM3b25GYldyYWlVYVJjQTUvZ3lWbXR0YWpGTE5MR0hp?=
 =?utf-8?B?ZUNXbS9xT3hSRzVxdXBidEswekhDRkhkTXJHZXRSNk1JU1RTenJqQWpvUVYy?=
 =?utf-8?B?eEt0VnJhTmFTZkZscVl4dDVHSlgzbERhQnlHdmFyTnZ0bi9OWE9GSndyNHNk?=
 =?utf-8?B?a0dtSzh6dGxaTkdXZmkyL0NwYlhFOUhJajRvZmdYSGxZUFJZRUhZbTBwTTQ3?=
 =?utf-8?B?cVlzaVFMME1sUnpza01zQkt1L0VKanFWdjE0ZEJVc1IyeVdWU0xncFRZdkVo?=
 =?utf-8?B?cGRtcW9ZdlVVMG15VjVTSThWaVRLK20ySldYeHoxcHVyRUF4TXc2V283TElO?=
 =?utf-8?B?dW5wb2dsRUF2WWpyNGV2MjAvQTFWTTBSNGVOZ09Sb3NOZWVYTGFQbXdEQ2xQ?=
 =?utf-8?B?dFZ3eFlsdmY0UkNRTWVvZzVlaDUxazdWTG1pY1hDcWs3VGoxWDA2bFZoZFYw?=
 =?utf-8?B?YlhiS3Jtc3JScnRKbVorUGg1RzFqWEh0Y01CSElub3BXTUpORDFEeEpYYldr?=
 =?utf-8?B?bURERFBNaTF3NnMwdXI3TC9tbFlvUGpFbzlQaHNlelR0UmpobjEydktDMkhU?=
 =?utf-8?B?blZ6L1hGTUx0NzBTajZEcGJTb2Rrak02U0N4enQvNG00WEZvNnJ1UnlPaElw?=
 =?utf-8?Q?QipiW5h5yn2l6DAZt7WL0YCYg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a10e239-18be-48e1-8ab1-08dbc5d33587
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:45:13.1669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyJ5QscveMwtXhAQeE/Tyi06+4XAvQ2VOiRE3YvUNln/1wkjvx+aqSiLEELYfYZufgUxZab1SErEQ6akIB3jmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

On 10/5/2023 11:07, Dustin L. Howett wrote:
> The original Framework Laptop contains a Microchip EC, but the newer
> ones have switched to an NPCX EC which uses the standard linear MMIO
> protocol for host commands and EC memory.
> 
> However, those newer Framework Laptops diverge from the standard
> ChromeOS EC in two important ways:
> 
> 1. The ACPI table for PNP0C09 only claims I/O ports 0x800 to 0x8FE
>     instead of the traditional 0x8FF
> 2. The MMIO region for EC memory begins at port 0xE00 rather than the
>     traditional 0x900.
> 
> cros_ec_lpc's quirks system addresses both of these issues.
> 
> Signed-off-by: Dustin L. Howett <dustin@howett.net>
> ---
>   drivers/platform/chrome/cros_ec_lpc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index c06575625d2f..66285c66ff22 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -537,6 +537,13 @@ static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
>   
> +static const struct lpc_driver_data framework_laptop_lpc_driver_data __initconst = {
> +	.quirks =
> +		CROS_EC_LPC_QUIRK_REMAP_MEMORY |
> +		CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION,
> +	.quirk_mmio_memory_base = 0xE00,
> +};

I think it would be really helpful for anyone that looks at this commit 
and scratches their head to have a decoder here as a comment along these 
lines to explain how this works (correct it for any inaccuracies please):

/*
  * 13" Gen 11 Intel uses Microchip EC
  * 13" Gen 12 Intel and newer use NPCX EC
  * 13"/16" Gen 1 AMD and newer use NPCX EC
  * These quirks set up the values used in cros_ec_lpc_probe() to be 
able to discover them properly with accordance to the fallback probing 
logic.
  */

If those comments grow stale because Gen 14 Intel or Gen 2 AMD change 
offsets or vendors, then the comment can be changed too, or a second 
quirk be introduced.

In the event that these need to change again in any way in the future 
models, it may be better to introduce a _DSD in the BIOS to allow the 
kernel to be able to discover values that would otherwise be included in 
a quirk.

> +
>   static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
>   	{
>   		/*
> @@ -596,6 +603,7 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
>   		},
> +		.driver_data = (void *)&framework_laptop_lpc_driver_data,
>   	},
>   	{ /* sentinel */ }
>   };

